"""Rendering model declarations as Swift source."""

from __future__ import annotations

from .model import Declaration, Enum, Struct, Typealias, Union
from .swiftfmt import (
    availability,
    documentation,
    file_contents,
    indent,
    raw_value_literal,
    string_literal,
)


def render_namespace_file() -> str:
    """Renders the namespace the generated operation types are nested in."""
    return file_contents(
        """\
/// The namespace containing every generated operation type.
///
/// An operation describes a request without performing one. Construct one and hand it to
/// ``PlexClient/send(_:)`` when you need the response metadata, or call the equivalent method
/// on an API namespace — ``PlexClient/library``, ``PlexClient/hubs`` and so on — to get just
/// the decoded body.
public enum Operations {}
"""
    )


def render_file(declarations: list[Declaration]) -> str:
    """Renders ``declarations`` into one Swift file."""
    body = "\n\n".join(render(declaration) for declaration in declarations)
    return file_contents("import Foundation\n\n" + body)


def render(declaration: Declaration) -> str:
    if isinstance(declaration, Struct):
        return _render_struct(declaration)
    if isinstance(declaration, Enum):
        return _render_enum(declaration)
    if isinstance(declaration, Union):
        return _render_union(declaration)
    if isinstance(declaration, Typealias):
        return _render_typealias(declaration)
    raise TypeError(f"Unsupported declaration: {declaration!r}")


# -- Structs ------------------------------------------------------------------------


def _render_struct(struct: Struct) -> str:
    lines = documentation(struct.documentation)
    lines += availability(struct.deprecated, "This type is deprecated in the Plex API.")
    lines.append(f"public struct {struct.name}: Codable, Hashable, Sendable {{")

    members: list[str] = []

    for prop in struct.properties:
        member = documentation(_property_documentation(prop))
        member.append(f"public let {prop.swift_name}: {prop.rendered_type}")
        members.append("\n".join(member))

    members.append(_render_memberwise_init(struct))

    coding_keys = _render_coding_keys(struct)
    if coding_keys:
        members.append(coding_keys)

    lines.append("\n\n".join(indent(member) for member in members))
    lines.append("}")
    return "\n".join(lines)


def _property_documentation(prop) -> str | None:
    """The doc comment for a stored property, including any deprecation notice.

    A deprecated property carries its notice in prose rather than as `@available(*,
    deprecated)`. The attribute would be better — the compiler would flag uses — but the
    memberwise initialiser has to assign every stored property, including deprecated ones, and
    that assignment is itself a use. There is no way to exempt it, so the attribute makes the
    generated code warn about itself on every build, drowning the warnings a consumer should
    actually see. The prose notice still reaches them through Quick Help and DocC.
    """
    if not prop.deprecated:
        return prop.documentation
    notice = "- Warning: Deprecated in the Plex API."
    return f"{prop.documentation}\n\n{notice}" if prop.documentation else notice


def _render_memberwise_init(struct: Struct) -> str:
    """A public memberwise initialiser.

    Swift's implicit memberwise initialiser is internal, so without this one the models cannot
    be constructed outside the module — which tests, previews and fixtures all need to do.
    Optional properties default to `nil` so that building a value only requires the fields that
    matter to the caller.
    """
    if not struct.properties:
        return "public init() {}"

    parameters = [
        f"{prop.label}: {prop.rendered_type}" + (" = nil" if prop.is_optional else "")
        for prop in struct.properties
    ]
    assignments = [
        f"self.{prop.swift_name} = {prop.swift_name}" for prop in struct.properties
    ]

    signature = "public init(\n" + indent(",\n".join(parameters)) + "\n) {"
    return signature + "\n" + indent("\n".join(assignments)) + "\n}"


def _render_coding_keys(struct: Struct) -> str:
    """A `CodingKeys` enum, emitted only when some property name differs from its JSON key."""
    if not any(prop.needs_coding_key for prop in struct.properties):
        return ""

    cases = []
    for prop in struct.properties:
        if prop.needs_coding_key:
            cases.append(f"case {prop.swift_name} = {string_literal(prop.json_key)}")
        else:
            cases.append(f"case {prop.swift_name}")

    return "private enum CodingKeys: String, CodingKey {\n" + indent("\n".join(cases)) + "\n}"


# -- Enums --------------------------------------------------------------------------


def _render_enum(enum: Enum) -> str:
    lines = documentation(enum.documentation)
    lines += availability(enum.deprecated, "This type is deprecated in the Plex API.")
    lines.append(
        f"public enum {enum.name}: {enum.raw_type}, Codable, Hashable, Sendable, CaseIterable {{"
    )

    cases = []
    for case in enum.cases:
        rendered = documentation(case.documentation)
        rendered.append(f"case {case.swift_name} = {raw_value_literal(case.raw_value)}")
        cases.append("\n".join(rendered))

    lines.append(indent("\n".join(cases)))
    lines.append("}")
    return "\n".join(lines)


# -- Unions -------------------------------------------------------------------------


def _render_union(union: Union) -> str:
    """A `oneOf` schema, as an enum with one case per member.

    Decoding tries each case in the order the specification lists them and takes the first that
    succeeds, which is what `oneOf` means in practice for this API — the members are distinct
    shapes rather than overlapping ones.
    """
    lines = documentation(union.documentation)
    lines += availability(union.deprecated, "This type is deprecated in the Plex API.")
    lines.append(f"public enum {union.name}: Codable, Hashable, Sendable {{")

    members: list[str] = []
    members.append(
        "\n".join(f"case {case.swift_name}({case.type_name})" for case in union.cases)
    )

    attempts = "\n".join(
        f"if let value = try? container.decode({case.type_name}.self) {{\n"
        + indent(f"self = .{case.swift_name}(value)")
        + "\n"
        + indent("return")
        + "\n}"
        for case in union.cases
    )
    expected = ", ".join(case.type_name for case in union.cases)
    decoder = (
        "public init(from decoder: any Decoder) throws {\n"
        + indent("let container = try decoder.singleValueContainer()")
        + "\n"
        + indent(attempts)
        + "\n"
        + indent(
            "throw DecodingError.typeMismatch(\n"
            + indent(f"{union.name}.self,")
            + "\n"
            + indent(
                "DecodingError.Context(\n"
                + indent("codingPath: container.codingPath,")
                + "\n"
                + indent(
                    f"debugDescription: {string_literal(f'Expected one of: {expected}')}"
                )
                + "\n)"
            )
            + "\n)"
        )
        + "\n}"
    )
    members.append(decoder)

    encode_cases = "\n".join(
        f"case .{case.swift_name}(let value): try container.encode(value)"
        for case in union.cases
    )
    encoder = (
        "public func encode(to encoder: any Encoder) throws {\n"
        + indent("var container = encoder.singleValueContainer()")
        + "\n"
        + indent("switch self {\n" + encode_cases + "\n}")
        + "\n}"
    )
    members.append(encoder)

    lines.append("\n\n".join(indent(member) for member in members))
    lines.append("}")
    return "\n".join(lines)


# -- Typealiases --------------------------------------------------------------------


def _render_typealias(alias: Typealias) -> str:
    lines = documentation(alias.documentation)
    lines += availability(alias.deprecated, "This type is deprecated in the Plex API.")
    lines.append(f"public typealias {alias.name} = {alias.target}")
    return "\n".join(lines)
