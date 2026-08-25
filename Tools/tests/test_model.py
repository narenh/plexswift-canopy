import textwrap
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory

from plexgen import spec as spec_module
from plexgen.model import Enum, ModelBuilder, Struct, Typealias, Union

HEADER = """
    openapi: 3.1.1
    info: {title: T, version: '1'}
    paths: {}
    components:
      schemas:
"""


def build(schemas: str) -> ModelBuilder:
    text = textwrap.dedent(HEADER) + textwrap.indent(textwrap.dedent(schemas), " " * 8)
    with TemporaryDirectory() as directory:
        path = Path(directory) / "spec.yaml"
        path.write_text(text, encoding="utf-8")
        spec = spec_module.load(path)
    builder = ModelBuilder(spec)
    builder.build_components()
    return builder


class StructTests(unittest.TestCase):
    def test_object_becomes_a_struct(self):
        builder = build(
            """
            Thing:
              type: object
              required: [id]
              properties:
                id: {type: integer}
                name: {type: string}
            """
        )
        thing = builder.declarations["Thing"]
        self.assertIsInstance(thing, Struct)
        self.assertEqual(
            [(p.swift_name, p.rendered_type) for p in thing.properties],
            [("id", "Int"), ("name", "String?")],
        )

    def test_properties_not_listed_as_required_are_optional(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                a: {type: string}
            """
        )
        self.assertTrue(builder.declarations["Thing"].properties[0].is_optional)

    def test_a_required_but_nullable_property_is_still_optional(self):
        builder = build(
            """
            Thing:
              type: object
              required: [a]
              properties:
                a: {type: [string, 'null']}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].rendered_type, "String?")

    def test_coding_key_is_only_needed_when_the_name_changes(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                ratingKey: {type: string}
                rating_key: {type: string}
            """
        )
        properties = {p.swift_name: p for p in builder.declarations["Thing"].properties}
        self.assertFalse(properties["ratingKey"].needs_coding_key)
        self.assertTrue(properties["ratingKey2"].needs_coding_key)
        self.assertEqual(properties["ratingKey2"].json_key, "rating_key")

    def test_property_names_that_collide_are_disambiguated(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                rating-key: {type: string}
                ratingKey: {type: string}
            """
        )
        names = [p.swift_name for p in builder.declarations["Thing"].properties]
        self.assertEqual(names, ["ratingKey", "ratingKey2"])

    def test_swift_keywords_are_escaped(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                default: {type: string}
            """
        )
        prop = builder.declarations["Thing"].properties[0]
        self.assertEqual(prop.swift_name, "`default`")
        self.assertFalse(prop.needs_coding_key)

    def test_description_is_carried_through(self):
        builder = build(
            """
            Thing:
              type: object
              description: A thing.
              properties:
                a: {type: string, description: The a.}
            """
        )
        thing = builder.declarations["Thing"]
        self.assertEqual(thing.documentation, "A thing.")
        self.assertEqual(thing.properties[0].documentation, "The a.")


class TypeMappingTests(unittest.TestCase):
    def test_primitive_formats(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                s: {type: string}
                i: {type: integer, format: int32}
                l: {type: integer, format: int64}
                d: {type: number, format: float}
                b: {type: boolean}
                bin: {type: string, format: binary}
            """
        )
        types = {p.swift_name: p.type_name for p in builder.declarations["Thing"].properties}
        self.assertEqual(
            types,
            {"s": "String", "i": "Int", "l": "Int", "d": "Double", "b": "Bool", "bin": "Data"},
        )

    def test_arrays_become_swift_arrays(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                tags: {type: array, items: {type: string}}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].type_name, "[String]")

    def test_nullable_array(self):
        builder = build(
            """
            Thing:
              type: object
              required: [tags]
              properties:
                tags: {type: [array, 'null'], items: {type: integer}}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].rendered_type, "[Int]?")

    def test_reference_becomes_a_type_reference_not_a_copy(self):
        builder = build(
            """
            Leaf:
              type: object
              properties:
                a: {type: string}
            Thing:
              type: object
              properties:
                leaf: {$ref: '#/components/schemas/Leaf'}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].type_name, "Leaf")
        # The referenced schema is declared exactly once.
        self.assertEqual(
            [name for name in builder.declarations if name.startswith("Leaf")], ["Leaf"]
        )

    def test_array_of_references(self):
        builder = build(
            """
            Leaf:
              type: object
              properties: {a: {type: string}}
            Thing:
              type: object
              properties:
                leaves: {type: array, items: {$ref: '#/components/schemas/Leaf'}}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].type_name, "[Leaf]")

    def test_object_without_properties_stays_free_form(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                blob: {type: object}
                anything: {}
            """
        )
        types = {p.swift_name: p.type_name for p in builder.declarations["Thing"].properties}
        self.assertEqual(types, {"blob": "AnyJSON", "anything": "AnyJSON"})


class InlineSchemaTests(unittest.TestCase):
    def test_inline_object_is_hoisted_and_named_after_its_path(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                container:
                  type: object
                  properties:
                    size: {type: integer}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].type_name, "ThingContainer")
        hoisted = builder.declarations["ThingContainer"]
        self.assertIsInstance(hoisted, Struct)
        self.assertEqual(hoisted.properties[0].swift_name, "size")

    def test_inline_array_element_is_hoisted(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                parts:
                  type: array
                  items:
                    type: object
                    properties: {id: {type: integer}}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].type_name, "[ThingPartsItem]")
        self.assertIn("ThingPartsItem", builder.declarations)

    def test_a_component_keeps_its_name_against_a_colliding_inline_schema(self):
        # "ThingChild" exists as a component, so the inline schema at Thing.child — which would
        # also want that name — has to yield.
        builder = build(
            """
            Thing:
              type: object
              properties:
                child:
                  type: object
                  properties: {a: {type: string}}
            ThingChild:
              type: object
              properties: {b: {type: string}}
            """
        )
        self.assertEqual(
            [p.swift_name for p in builder.declarations["ThingChild"].properties], ["b"]
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].type_name, "ThingChild2")


class EnumTests(unittest.TestCase):
    def test_string_enum(self):
        builder = build(
            """
            Kind:
              type: string
              enum: [movie, show, season]
            """
        )
        kind = builder.declarations["Kind"]
        self.assertIsInstance(kind, Enum)
        self.assertEqual(kind.raw_type, "String")
        self.assertEqual([c.swift_name for c in kind.cases], ["movie", "show", "season"])

    def test_integer_enum(self):
        builder = build(
            """
            Generator:
              type: integer
              enum: [-1, 42]
            """
        )
        generator = builder.declarations["Generator"]
        self.assertEqual(generator.raw_type, "Int")
        self.assertEqual([c.swift_name for c in generator.cases], ["nMinus1", "n42"])
        self.assertEqual([c.raw_value for c in generator.cases], [-1, 42])

    def test_null_is_dropped_from_the_cases(self):
        builder = build(
            """
            Kind:
              type: [string, 'null']
              enum: [movie, null]
            """
        )
        self.assertEqual([c.swift_name for c in builder.declarations["Kind"].cases], ["movie"])

    def test_an_enum_with_only_null_falls_back_to_free_form(self):
        builder = build(
            """
            Kind:
              enum: [null]
            """
        )
        self.assertIsInstance(builder.declarations["Kind"], Typealias)
        self.assertEqual(builder.declarations["Kind"].target, "AnyJSON")

    def test_inline_enum_property_is_hoisted(self):
        builder = build(
            """
            Thing:
              type: object
              properties:
                kind: {type: string, enum: [a, b]}
            """
        )
        self.assertEqual(builder.declarations["Thing"].properties[0].type_name, "ThingKind")
        self.assertIsInstance(builder.declarations["ThingKind"], Enum)


class UnionTests(unittest.TestCase):
    def test_one_of_becomes_a_union(self):
        builder = build(
            """
            Leaf:
              type: object
              properties: {a: {type: string}}
            Either:
              oneOf:
                - {type: string}
                - {$ref: '#/components/schemas/Leaf'}
            """
        )
        either = builder.declarations["Either"]
        self.assertIsInstance(either, Union)
        self.assertEqual(
            [(c.swift_name, c.type_name) for c in either.cases],
            [("string", "String"), ("leaf", "Leaf")],
        )


class TypealiasTests(unittest.TestCase):
    def test_scalar_component_becomes_a_typealias(self):
        builder = build(
            """
            Identifier:
              type: string
              description: An identifier.
            """
        )
        alias = builder.declarations["Identifier"]
        self.assertIsInstance(alias, Typealias)
        self.assertEqual(alias.target, "String")
        self.assertEqual(alias.documentation, "An identifier.")

    def test_array_component_becomes_a_typealias(self):
        builder = build(
            """
            Names:
              type: array
              items: {type: string}
            """
        )
        self.assertEqual(builder.declarations["Names"].target, "[String]")


class AllOfTests(unittest.TestCase):
    def test_all_of_members_are_merged_into_one_struct(self):
        builder = build(
            """
            Base:
              type: object
              required: [id]
              properties: {id: {type: integer}}
            Derived:
              allOf:
                - {$ref: '#/components/schemas/Base'}
                - type: object
                  properties: {name: {type: string}}
            """
        )
        derived = builder.declarations["Derived"]
        self.assertEqual(
            [(p.swift_name, p.rendered_type) for p in derived.properties],
            [("id", "Int"), ("name", "String?")],
        )


class DeterminismTests(unittest.TestCase):
    SCHEMAS = """
        Leaf:
          type: object
          properties: {a: {type: string}}
        Thing:
          type: object
          properties:
            inline: {type: object, properties: {b: {type: integer}}}
            leaf: {$ref: '#/components/schemas/Leaf'}
            kind: {type: string, enum: [x, y]}
        """

    def test_two_runs_produce_identical_declarations(self):
        first = build(self.SCHEMAS).declarations
        second = build(self.SCHEMAS).declarations

        self.assertEqual(list(first), list(second))
        for name in first:
            self.assertEqual(repr(first[name]), repr(second[name]))


if __name__ == "__main__":
    unittest.main()
