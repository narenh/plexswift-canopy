import textwrap
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory

from plexgen import spec as spec_module
from plexgen.spec import SpecError


def load_spec(text: str):
    with TemporaryDirectory() as directory:
        path = Path(directory) / "spec.yaml"
        path.write_text(textwrap.dedent(text), encoding="utf-8")
        return spec_module.load(path)


MINIMAL = """
    openapi: 3.1.1
    info:
      title: Test
      version: 1.2.3
    paths: {}
    components:
      schemas: {}
    """


class LoadTests(unittest.TestCase):
    def test_reads_info(self):
        spec = load_spec(MINIMAL)
        self.assertEqual(spec.version, "1.2.3")
        self.assertEqual(spec.title, "Test")

    def test_rejects_a_non_document(self):
        with self.assertRaises(SpecError):
            load_spec("- just\n- a list\n")

    def test_strips_example_payloads(self):
        spec = load_spec(
            """
            openapi: 3.1.1
            info: {title: T, version: '1'}
            paths: {}
            components:
              schemas:
                Thing:
                  type: object
                  example:
                    type: this-is-not-a-schema-keyword
                  properties:
                    name: {type: string}
            """
        )
        self.assertNotIn("example", spec.schemas["Thing"])
        self.assertIn("properties", spec.schemas["Thing"])


class ResolveTests(unittest.TestCase):
    def setUp(self):
        self.spec = load_spec(
            """
            openapi: 3.1.1
            info: {title: T, version: '1'}
            paths: {}
            components:
              schemas:
                Leaf:
                  type: string
                Alias:
                  $ref: '#/components/schemas/Leaf'
                Loop:
                  $ref: '#/components/schemas/Loop'
            """
        )

    def test_follows_a_reference(self):
        self.assertEqual(self.spec.resolve({"$ref": "#/components/schemas/Leaf"}), {"type": "string"})

    def test_follows_a_chain_of_references(self):
        self.assertEqual(self.spec.resolve({"$ref": "#/components/schemas/Alias"}), {"type": "string"})

    def test_returns_a_plain_node_untouched(self):
        self.assertEqual(self.spec.resolve({"type": "integer"}), {"type": "integer"})

    def test_sibling_keywords_refine_the_target(self):
        resolved = self.spec.resolve(
            {"$ref": "#/components/schemas/Leaf", "description": "a leaf"}
        )
        self.assertEqual(resolved, {"type": "string", "description": "a leaf"})

    def test_detects_a_circular_reference(self):
        with self.assertRaises(SpecError):
            self.spec.resolve({"$ref": "#/components/schemas/Loop"})

    def test_rejects_an_external_reference(self):
        with self.assertRaises(SpecError):
            self.spec.resolve({"$ref": "other.yaml#/Thing"})

    def test_reports_an_unresolvable_reference(self):
        with self.assertRaises(SpecError):
            self.spec.resolve({"$ref": "#/components/schemas/Missing"})

    def test_schema_name_for_ref(self):
        self.assertEqual(
            self.spec.schema_name_for_ref("#/components/schemas/Leaf"), "Leaf"
        )
        self.assertIsNone(self.spec.schema_name_for_ref("#/components/responses/400"))


class FlattenTests(unittest.TestCase):
    def setUp(self):
        self.spec = load_spec(
            """
            openapi: 3.1.1
            info: {title: T, version: '1'}
            paths: {}
            components:
              schemas:
                Base:
                  type: object
                  required: [id]
                  properties:
                    id: {type: integer}
                Derived:
                  allOf:
                    - $ref: '#/components/schemas/Base'
                    - type: object
                      required: [name]
                      properties:
                        name: {type: string}
                WithSibling:
                  allOf:
                    - $ref: '#/components/schemas/Base'
                  description: refined
                Nested:
                  allOf:
                    - $ref: '#/components/schemas/Derived'
                    - type: object
                      properties:
                        extra: {type: boolean}
            """
        )

    def test_merges_properties_from_every_member(self):
        merged = self.spec.flatten(self.spec.schemas["Derived"])
        self.assertEqual(set(merged["properties"]), {"id", "name"})

    def test_unions_required_lists(self):
        merged = self.spec.flatten(self.spec.schemas["Derived"])
        self.assertEqual(merged["required"], ["id", "name"])

    def test_infers_object_type_for_a_merged_schema(self):
        merged = self.spec.flatten(self.spec.schemas["Derived"])
        self.assertEqual(merged["type"], "object")

    def test_keywords_beside_all_of_are_applied(self):
        merged = self.spec.flatten(self.spec.schemas["WithSibling"])
        self.assertEqual(merged["description"], "refined")
        self.assertEqual(set(merged["properties"]), {"id"})

    def test_merges_recursively(self):
        merged = self.spec.flatten(self.spec.schemas["Nested"])
        self.assertEqual(set(merged["properties"]), {"id", "name", "extra"})

    def test_leaves_a_plain_schema_alone(self):
        self.assertEqual(self.spec.flatten({"type": "string"}), {"type": "string"})

    def test_does_not_mutate_the_source_schema(self):
        before = dict(self.spec.schemas["Base"])
        self.spec.flatten(self.spec.schemas["Derived"])
        self.assertEqual(self.spec.schemas["Base"], before)


class OperationTests(unittest.TestCase):
    def setUp(self):
        self.spec = load_spec(
            """
            openapi: 3.1.1
            info: {title: T, version: '1'}
            security:
              - token: []
            servers:
              - url: 'http://localhost:32400'
            paths:
              /thing/{id}:
                parameters:
                  - name: id
                    in: path
                    required: true
                    schema: {type: integer}
                get:
                  operationId: getThing
                  tags: [Library]
                  summary: Get a thing
                  parameters:
                    - name: verbose
                      in: query
                      schema: {type: boolean}
                  responses:
                    '200': {description: OK}
                post:
                  operationId: setThing
                  tags: [Library]
                  servers:
                    - url: 'https://plex.tv/api/v2'
                  security: []
                  deprecated: true
                  responses:
                    '204': {description: No Content}
            components:
              schemas: {}
            """
        )

    def test_collects_every_method(self):
        self.assertEqual(
            {operation.operation_id for operation in self.spec.operations},
            {"getThing", "setThing"},
        )

    def test_path_level_parameters_are_merged_into_each_operation(self):
        get = next(o for o in self.spec.operations if o.operation_id == "getThing")
        self.assertEqual([p["name"] for p in get.parameters], ["id", "verbose"])

    def test_operation_servers_override_the_document(self):
        post = next(o for o in self.spec.operations if o.operation_id == "setThing")
        self.assertEqual(post.servers, ("https://plex.tv/api/v2",))

    def test_operations_without_servers_report_none(self):
        get = next(o for o in self.spec.operations if o.operation_id == "getThing")
        self.assertEqual(get.servers, ())

    def test_document_security_is_inherited(self):
        get = next(o for o in self.spec.operations if o.operation_id == "getThing")
        self.assertEqual(get.security, ({"token": []},))

    def test_empty_operation_security_disables_inheritance(self):
        post = next(o for o in self.spec.operations if o.operation_id == "setThing")
        self.assertEqual(post.security, ())

    def test_deprecation_is_recorded(self):
        post = next(o for o in self.spec.operations if o.operation_id == "setThing")
        self.assertTrue(post.deprecated)

    def test_primary_tag(self):
        get = next(o for o in self.spec.operations if o.operation_id == "getThing")
        self.assertEqual(get.primary_tag, "Library")

    def test_missing_operation_id_is_rejected(self):
        with self.assertRaises(SpecError):
            load_spec(
                """
                openapi: 3.1.1
                info: {title: T, version: '1'}
                paths:
                  /thing:
                    get:
                      responses: {'200': {description: OK}}
                components: {schemas: {}}
                """
            )

    def test_duplicate_operation_id_is_rejected(self):
        with self.assertRaises(SpecError):
            load_spec(
                """
                openapi: 3.1.1
                info: {title: T, version: '1'}
                paths:
                  /a:
                    get:
                      operationId: dup
                      responses: {'200': {description: OK}}
                  /b:
                    get:
                      operationId: dup
                      responses: {'200': {description: OK}}
                components: {schemas: {}}
                """
            )


if __name__ == "__main__":
    unittest.main()
