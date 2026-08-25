"""Rendering operations and their API namespaces as Swift source."""

from __future__ import annotations

import re
from collections import defaultdict

from . import naming
from .operations import OperationSpec, Parameter
from .swiftfmt import (
    availability,
    documentation,
    file_contents,
    indent,
    string_literal,
)

_PATH_PLACEHOLDER = re.compile(r"\{([^}]+)\}")


def render_operation_file(operation: OperationSpec) -> str:
    """Renders one operation as a `PlexOperation` conforming struct."""
    body = (
        "import Foundation\n\n"
        + "extension Operations {\n"
        + indent(_render_operation(operation))
        + "\n}"
    )
    return file_contents(body)


def render_namespace_file(tag: str, operations: list[OperationSpec]) -> str:
    """Renders the API namespace grouping ``operations`` under ``tag``."""
    type_name = namespace_type_name(tag)
    property_name = naming.camel_case(tag)

    methods = "\n\n".join(_render_method(operation) for operation in operations)

    body = f"""\
import Foundation

/// The `{tag}` operations of the Plex API.
///
/// Reached through ``PlexClient/{property_name}``.
public struct {type_name}: Sendable {{
{indent("let client: PlexClient")}

{indent(methods)}
}}

extension PlexClient {{
{indent(f"/// The `{tag}` operations of the Plex API.")}
{indent(f"public var {property_name}: {type_name} {{ {type_name}(client: self) }}")}
}}
"""
    return file_contents(body)


def namespace_type_name(tag: str) -> str:
    return naming.type_name(tag) + "API"


def group_by_tag(operations: list[OperationSpec]) -> dict[str, list[OperationSpec]]:
    grouped: dict[str, list[OperationSpec]] = defaultdict(list)
    for operation in operations:
        grouped[operation.tag].append(operation)
    return dict(grouped)


# -- Operation types ------------------------------------------------------------------


def _render_operation(operation: OperationSpec) -> str:
    lines = documentation(operation.documentation)
    lines += availability(operation.deprecated)
    lines.append(f"public struct {operation.swift_name}: PlexOperation {{")

    members: list[str] = [_render_static_members(operation)]

    if operation.has_inputs:
        members.append(_render_stored_properties(operation))
        members.append(_render_initialiser(operation))

    members.append(_render_path(operation))

    if operation.query_parameters:
        members.append(_render_query_items(operation))
    if operation.header_parameters:
        members.append(_render_headers(operation))
    if operation.body is not None:
        members.append(_render_body(operation))

    lines.append("\n\n".join(indent(member) for member in members))
    lines.append("}")
    return "\n".join(lines)


def _render_static_members(operation: OperationSpec) -> str:
    lines = [
        f"public typealias Success = {operation.success_type}",
        "",
        f"public static let operationID = {string_literal(operation.operation_id)}",
        f"public static let method = HTTPMethod.{operation.method}",
        f"public static let host = OperationHost{operation.host}",
        f"public static let requiresToken = {str(operation.requires_token).lower()}",
        "public static let requiresClientIdentifier = "
        f"{str(operation.requires_client_identifier).lower()}",
    ]
    return "\n".join(lines)


def _render_stored_properties(operation: OperationSpec) -> str:
    members: list[str] = []
    for parameter in operation.parameters:
        rendered = documentation(parameter.documentation)
        rendered.append(f"public var {parameter.swift_name}: {parameter.rendered_type}")
        members.append("\n".join(rendered))

    if operation.body is not None:
        members.append(
            "\n".join(
                documentation("The request body.")
                + [f"public var body: {operation.body.rendered_type}"]
            )
        )

    return "\n\n".join(members)


def _render_initialiser(operation: OperationSpec) -> str:
    parameters: list[str] = []
    assignments: list[str] = []

    for parameter in operation.parameters:
        default = " = nil" if parameter.is_optional else ""
        parameters.append(f"{parameter.label}: {parameter.rendered_type}{default}")
        assignments.append(f"self.{parameter.swift_name} = {parameter.swift_name}")

    if operation.body is not None:
        default = " = nil" if operation.body.is_optional else ""
        parameters.append(f"body: {operation.body.rendered_type}{default}")
        assignments.append("self.body = body")

    signature = "public init(\n" + indent(",\n".join(parameters)) + "\n) {"
    return signature + "\n" + indent("\n".join(assignments)) + "\n}"


def _render_path(operation: OperationSpec) -> str:
    """Renders the `path` property, interpolating any path parameters.

    Path parameter values are percent-encoded before substitution. Without that a rating key
    or section title containing `/` or `?` would silently change which endpoint is called.
    """
    by_wire_name = {p.wire_name: p for p in operation.path_parameters}

    if not by_wire_name:
        return f"public var path: String {{ {string_literal(operation.path)} }}"

    def replace(match: re.Match[str]) -> str:
        wire_name = match.group(1)
        parameter = by_wire_name.get(wire_name)
        if parameter is None:
            raise ValueError(
                f"{operation.operation_id}: path references {{{wire_name}}} "
                "but declares no such path parameter"
            )
        return f"\\({_value_expression(parameter)})"

    interpolated = _PATH_PLACEHOLDER.sub(replace, operation.path)
    return f'public var path: String {{ "{interpolated}" }}'


def _render_query_items(operation: OperationSpec) -> str:
    throws = " throws" if operation.query_can_throw else ""
    lines = [
        f"public var queryItems: [URLQueryItem] {{ get{throws} {{" if throws
        else "public var queryItems: [URLQueryItem] {",
        indent("var items: [URLQueryItem] = []"),
    ]

    for parameter in operation.query_parameters:
        lines.append(indent(_render_query_item(parameter)))

    lines.append(indent("return items"))
    lines.append("} }" if throws else "}")
    return "\n".join(lines)


def _render_query_item(parameter: Parameter) -> str:
    name = string_literal(parameter.wire_name)

    if parameter.is_object:
        # An object-valued parameter is expanded in the OpenAPI `deepObject` style.
        body = (
            f"items.append(contentsOf: try DeepObjectQuery.items(name: {name}, value: value))"
        )
        if parameter.is_optional:
            return f"if let value = {parameter.swift_name} {{\n" + indent(body) + "\n}"
        return "do {\n" + indent(f"let value = {parameter.swift_name}\n" + body) + "\n}"

    if parameter.is_array:
        element = "element"
        append = (
            f"items.append(URLQueryItem(name: {name}, "
            f"value: QueryValue({element}).encoded))"
            if parameter.explode
            else f"items.append(URLQueryItem(name: {name}, "
            f"value: value.map {{ QueryValue($0).encoded }}.joined(separator: \",\")))"
        )
        if parameter.explode:
            body = f"for {element} in value {{\n" + indent(append) + "\n}"
        else:
            body = append
    else:
        body = f"items.append(URLQueryItem(name: {name}, value: QueryValue(value).encoded))"

    if parameter.is_optional:
        return f"if let value = {parameter.swift_name} {{\n" + indent(body) + "\n}"
    return f"do {{\n" + indent(f"let value = {parameter.swift_name}\n" + body) + "\n}"


def _render_headers(operation: OperationSpec) -> str:
    lines = ["public var headers: [String: String] {", indent("var headers: [String: String] = [:]")]

    for parameter in operation.header_parameters:
        name = string_literal(parameter.wire_name)
        assignment = f"headers[{name}] = QueryValue(value).encoded"
        if parameter.is_optional:
            lines.append(
                indent(f"if let value = {parameter.swift_name} {{\n" + indent(assignment) + "\n}")
            )
        else:
            lines.append(indent(f"headers[{name}] = QueryValue({parameter.swift_name}).encoded"))

    lines.append(indent("return headers"))
    lines.append("}")
    return "\n".join(lines)


def _render_body(operation: OperationSpec) -> str:
    body = operation.body
    assert body is not None

    if body.content_type == "application/json":
        expression = "try .json(value, encoder: encoder)"
    elif body.content_type == "text/plain":
        expression = "RequestBody.text(value)"
    elif body.content_type == "multipart/form-data":
        expression = (
            f"RequestBody.multipart(fieldName: {string_literal(body.multipart_field or 'file')}, "
            "data: value)"
        )
    else:
        expression = "try .json(value, encoder: encoder)"

    if body.is_optional:
        inner = (
            "guard let value = self.body else { return nil }\n"
            f"return {expression}"
        )
    else:
        inner = f"let value = self.body\nreturn {expression}"

    return (
        "public func body(encoder: JSONEncoder) throws -> RequestBody? {\n"
        + indent(inner)
        + "\n}"
    )


def _value_expression(parameter: Parameter) -> str:
    """The expression interpolated into the path for ``parameter``.

    An array path parameter uses OpenAPI's `simple` style: the elements joined by commas. Each
    element is percent-encoded *before* joining, so that a comma inside an element cannot forge
    a separator and change how the server splits the list.
    """
    if parameter.is_array:
        return (
            f"{parameter.swift_name}.map {{ PathComponent($0).description }}"
            '.joined(separator: ",")'
        )
    return f"PathComponent({parameter.swift_name})"


# -- Namespace methods ----------------------------------------------------------------


def _render_method(operation: OperationSpec) -> str:
    lines = documentation(operation.documentation)
    lines += availability(operation.deprecated)

    arguments: list[str] = []
    forwarded: list[str] = []

    for parameter in operation.parameters:
        default = " = nil" if parameter.is_optional else ""
        arguments.append(f"{parameter.label}: {parameter.rendered_type}{default}")
        forwarded.append(f"{parameter.label}: {parameter.swift_name}")

    if operation.body is not None:
        default = " = nil" if operation.body.is_optional else ""
        arguments.append(f"body: {operation.body.rendered_type}{default}")
        forwarded.append("body: body")

    signature_arguments = ("\n" + indent(",\n".join(arguments)) + "\n") if arguments else ""
    construction = (
        f"Operations.{operation.swift_name}(\n" + indent(",\n".join(forwarded)) + "\n)"
        if forwarded
        else f"Operations.{operation.swift_name}()"
    )

    lines.append("@discardableResult")
    lines.append(
        f"public func {operation.method_name}({signature_arguments}) "
        f"async throws(PlexError) -> {operation.success_type} {{"
    )
    lines.append(indent(f"try await client.perform({construction})"))
    lines.append("}")
    return "\n".join(lines)
