"""Turning resolved schemas into an intermediate representation of Swift declarations.

The IR sits between the spec and the emitted text so that the two hard problems stay
separate: deciding *what* types exist (here) and deciding how they *read* (in ``emit.py``).

Inline schemas — an object or enum written directly inside a property or a response rather
than under ``components/schemas`` — are hoisted into named top-level declarations, named after
the path taken to reach them. Nesting them inside their parent would be closer to the spec but
makes the types unusable: a caller cannot name ``Metadata.Media.Part`` without spelling out the
whole chain, and two identical inline schemas in different parents would become distinct types.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any

from . import naming
from .spec import Spec

# OpenAPI type/format pairs that map onto a Swift type directly.
PRIMITIVES: dict[tuple[str, str | None], str] = {
    ("string", None): "String",
    ("string", "date"): "String",
    ("string", "date-time"): "String",
    ("string", "email"): "String",
    ("string", "ipv4"): "String",
    ("string", "password"): "String",
    ("string", "uri"): "String",
    ("string", "binary"): "Data",
    ("integer", None): "Int",
    ("integer", "int32"): "Int",
    ("integer", "int64"): "Int",
    ("number", None): "Double",
    ("number", "float"): "Double",
    ("number", "double"): "Double",
    ("boolean", None): "Bool",
    ("null", None): "AnyJSON",
}

# Dates arrive from Plex as Unix timestamps in some places and as ISO-8601 strings in others,
# with the schema not distinguishing the two. Decoding both into `Date` would need a custom
# strategy per property, so date-ish strings stay `String` (see PRIMITIVES) and integer
# timestamps stay `Int`. Callers convert explicitly, which is lossless in both directions.


@dataclass
class Property:
    """One stored property of a generated struct."""

    swift_name: str
    json_key: str
    type_name: str
    is_optional: bool
    documentation: str | None = None
    deprecated: bool = False

    @property
    def rendered_type(self) -> str:
        return f"{self.type_name}?" if self.is_optional else self.type_name

    @property
    def needs_coding_key(self) -> bool:
        """Whether the property name differs from the JSON key it decodes from."""
        return self.swift_name.strip("`") != self.json_key


@dataclass
class Struct:
    """A generated `struct` with `Codable` conformance."""

    name: str
    properties: list[Property] = field(default_factory=list)
    documentation: str | None = None
    deprecated: bool = False

    kind = "struct"


@dataclass
class EnumCase:
    swift_name: str
    raw_value: Any
    documentation: str | None = None


@dataclass
class Enum:
    """A generated `enum` backed by a raw value."""

    name: str
    raw_type: str
    cases: list[EnumCase] = field(default_factory=list)
    documentation: str | None = None
    deprecated: bool = False

    kind = "enum"


@dataclass
class UnionCase:
    swift_name: str
    type_name: str


@dataclass
class Union:
    """A generated `enum` with associated values, for a ``oneOf`` schema."""

    name: str
    cases: list[UnionCase] = field(default_factory=list)
    documentation: str | None = None
    deprecated: bool = False

    kind = "union"


@dataclass
class Typealias:
    """A generated `typealias`, for a named schema that is just another type."""

    name: str
    target: str
    documentation: str | None = None
    deprecated: bool = False

    kind = "typealias"


Declaration = Struct | Enum | Union | Typealias


class ModelBuilder:
    """Builds the set of Swift declarations implied by a spec.

    **Every generated property is optional**, regardless of the schema's ``required`` list.

    That is a deliberate departure from the spec, taken because the spec contradicts itself:
    decoding the example payloads it publishes against the models its own ``required`` lists
    describe fails for 13 schemas. ``Stream`` requires ``streamType`` and then publishes an
    example without it; ``Items`` inherits ``title`` as required through an ``allOf`` and
    publishes an example with neither ``title`` nor ``type``.

    The examples are the better evidence. A real Plex Media Server omits fields freely
    depending on library type, agent, and server version, and a non-optional property turns
    any such omission into a thrown error that fails the entire request rather than leaving one
    value nil. Being wrong in that direction is expensive; being wrong in the other direction
    costs an optional unwrap.
    """

    def __init__(self, spec: Spec) -> None:
        self.spec = spec
        self.declarations: dict[str, Declaration] = {}
        self._taken_names: set[str] = set()
        # Maps a component schema name to the Swift type name chosen for it, so that a $ref
        # can be turned into a type reference without rebuilding the schema.
        self._component_types: dict[str, str] = {}

    # -- Entry points ---------------------------------------------------------------

    def build_components(self) -> None:
        """Registers a declaration for every schema under ``components/schemas``."""
        # Names are claimed for all components up front so that a component keeps its own
        # name even if an inline schema encountered earlier would have wanted it.
        for name in self.spec.schemas:
            swift_name = naming.disambiguate(naming.type_name(name), self._taken_names)
            self._component_types[name] = swift_name

        for name, schema in self.spec.schemas.items():
            self._declare(self._component_types[name], schema)

    def component_type_name(self, schema_name: str) -> str | None:
        """The Swift type name chosen for the component schema called ``schema_name``."""
        return self._component_types.get(schema_name)

    def type_reference(self, schema: Any, hint: str) -> str:
        """The Swift type for ``schema``, declaring one if it is inline and needs a name.

        ``hint`` is the name an inline declaration is given, before disambiguation.
        """
        if isinstance(schema, dict) and "$ref" in schema:
            name = self.spec.schema_name_for_ref(schema["$ref"])
            if name is not None:
                return self._component_types[name]

        resolved = self.spec.flatten(schema)
        return self._type_for(resolved, hint)

    # -- Declaration ----------------------------------------------------------------

    def _declare(self, swift_name: str, schema: Any) -> str:
        """Declares ``swift_name`` for ``schema`` and returns the type name to reference it by."""
        resolved = self.spec.flatten(schema)
        documentation = resolved.get("description")
        deprecated = bool(resolved.get("deprecated"))

        if "enum" in resolved:
            self.declarations[swift_name] = self._build_enum(swift_name, resolved)
            return swift_name

        if "oneOf" in resolved:
            self.declarations[swift_name] = self._build_union(swift_name, resolved)
            return swift_name

        if self._is_object(resolved):
            self.declarations[swift_name] = self._build_struct(swift_name, resolved)
            return swift_name

        # Anything else — a bare string, an array of something — becomes a typealias so the
        # component's name still exists in the generated API surface.
        target = self._type_for(resolved, swift_name, declare_self=False)
        self.declarations[swift_name] = Typealias(
            name=swift_name,
            target=target,
            documentation=documentation,
            deprecated=deprecated,
        )
        return swift_name

    def _type_for(self, resolved: dict[str, Any], hint: str, declare_self: bool = True) -> str:
        """The Swift type for an already-resolved, already-flattened schema."""
        types = self._types_of(resolved)

        if "array" in types:
            items = resolved.get("items", {})
            element = self.type_reference(items, naming.type_name(hint) + "Item")
            return f"[{element}]"

        if "enum" in resolved or "oneOf" in resolved or self._is_object(resolved):
            if not declare_self:
                # Called from _declare for a schema that turned out to need its own
                # declaration after all; declaring it again would recurse.
                return "AnyJSON"
            name = naming.disambiguate(naming.type_name(hint), self._taken_names)
            return self._declare(name, resolved)

        # A concrete scalar.
        scalar = next((t for t in types if t != "null"), None)
        if scalar is None:
            return "AnyJSON"
        mapped = PRIMITIVES.get((scalar, resolved.get("format")))
        if mapped is not None:
            return mapped
        return PRIMITIVES.get((scalar, None), "AnyJSON")

    # -- Builders -------------------------------------------------------------------

    def _build_struct(self, swift_name: str, resolved: dict[str, Any]) -> Struct:
        struct = Struct(
            name=swift_name,
            documentation=resolved.get("description"),
            deprecated=bool(resolved.get("deprecated")),
        )
        used_names: set[str] = set()

        for key, raw in resolved.get("properties", {}).items():
            property_schema = self.spec.flatten(raw)
            swift_property = naming.disambiguate(naming.property_name(key), used_names)
            type_name = self.type_reference(raw, f"{swift_name}{naming.pascal_case(key)}")

            struct.properties.append(
                Property(
                    swift_name=swift_property,
                    json_key=key,
                    type_name=type_name,
                    # Every property is optional; see the note on ModelBuilder.
                    is_optional=True,
                    documentation=property_schema.get("description"),
                    deprecated=bool(property_schema.get("deprecated")),
                )
            )

        return struct

    def _build_enum(self, swift_name: str, resolved: dict[str, Any]) -> Enum | Typealias:
        values = [value for value in resolved["enum"] if value is not None]
        if not values:
            return Typealias(
                name=swift_name,
                target="AnyJSON",
                documentation=resolved.get("description"),
            )

        raw_type = "Int" if all(isinstance(v, int) and not isinstance(v, bool) for v in values) else "String"
        if raw_type == "String":
            values = [str(value) for value in values]

        used: set[str] = set()
        cases = [
            EnumCase(
                swift_name=naming.disambiguate(naming.enum_case_name(value), used),
                raw_value=value,
            )
            for value in values
        ]

        return Enum(
            name=swift_name,
            raw_type=raw_type,
            cases=cases,
            documentation=resolved.get("description"),
            deprecated=bool(resolved.get("deprecated")),
        )

    def _build_union(self, swift_name: str, resolved: dict[str, Any]) -> Union:
        union = Union(
            name=swift_name,
            documentation=resolved.get("description"),
            deprecated=bool(resolved.get("deprecated")),
        )
        used: set[str] = set()
        for index, member in enumerate(resolved["oneOf"], start=1):
            type_name = self.type_reference(member, f"{swift_name}Case{index}")
            case_name = naming.disambiguate(
                naming.camel_case(type_name.strip("[]")) or f"case{index}", used
            )
            union.cases.append(UnionCase(swift_name=case_name, type_name=type_name))
        return union

    # -- Schema inspection ----------------------------------------------------------

    @staticmethod
    def _types_of(resolved: dict[str, Any]) -> set[str]:
        """The declared ``type`` as a set, since OpenAPI 3.1 allows a list."""
        declared = resolved.get("type")
        if declared is None:
            return set()
        if isinstance(declared, list):
            return set(declared)
        return {declared}

    @classmethod
    def _is_nullable(cls, resolved: dict[str, Any]) -> bool:
        return "null" in cls._types_of(resolved)

    @classmethod
    def _is_object(cls, resolved: dict[str, Any]) -> bool:
        """Whether a schema describes an object with a known shape.

        An object with no properties carries no more information than ``AnyJSON``, so it is
        left as free-form rather than generating an empty struct.
        """
        if not resolved.get("properties"):
            return False
        return "object" in cls._types_of(resolved) or "type" not in resolved
