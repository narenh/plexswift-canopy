"""Generating decoding tests from the examples the specification carries.

Every component schema in the Plex spec ships an ``example`` payload. Decoding each one into
the model generated for it is the strongest cheap check that the generated types actually
match the API: it catches a property typed as `Int` that arrives as a string, a field marked
required that the API omits, and an enum missing a case the API returns.
"""

from __future__ import annotations

import json
from typing import Any

from .model import ModelBuilder
from .spec import Spec
from .swiftfmt import file_contents, indent, string_literal


def collect_examples(spec: Spec, builder: ModelBuilder) -> dict[str, Any]:
    """Returns the example payload for each component schema that has one.

    Keyed by the Swift type name, so the emitted test can name the type directly. Examples are
    read from the raw document because ``spec.load`` strips them.
    """
    examples: dict[str, Any] = {}
    for name, schema in spec.schemas.items():
        example = spec.schema_example(name)
        if example is None:
            continue
        if _is_binary(schema):
            # A `format: binary` schema describes a raw response body, not a JSON value. Its
            # example is a placeholder for bytes ("<binary data>"), so there is nothing to
            # decode — operations returning one surface it as `Data` instead.
            continue
        swift_name = builder.component_type_name(name)
        if swift_name is None:
            continue
        examples[swift_name] = example
    return examples


def _is_binary(schema: Any) -> bool:
    return isinstance(schema, dict) and schema.get("format") == "binary"


def render_fixture(example: Any) -> str:
    """Renders an example payload as pretty-printed JSON."""
    return json.dumps(example, indent=2, sort_keys=True, ensure_ascii=False) + "\n"


def render_test_file(type_names: list[str]) -> str:
    """Renders the test that decodes every fixture into its model."""
    cases = "\n\n".join(_render_case(name) for name in type_names)

    body = f"""\
import Foundation
import XCTest
@testable import Plexswift

/// Decodes the example payload the specification publishes for each schema into the model
/// generated from that schema.
///
/// A failure here means the generated model and the specification disagree — a property typed
/// as `Int` that the example gives as a string, a field marked required that the example
/// omits, or an enum missing a case the API returns.
final class GeneratedModelDecodingTests: XCTestCase {{

{indent(_render_helper())}

{indent(cases)}
}}
"""
    return file_contents(body)


def _render_helper() -> str:
    return """\
/// Locates a fixture, tolerating either shape of resource bundle.
///
/// SwiftPM's `.copy` rule preserves the directory, so the fixtures normally sit under a
/// `Fixtures` subdirectory. Bundle layout differs between platforms, though, so the lookup
/// falls back to the bundle root rather than failing on a layout difference alone.
private func fixtureURL(_ name: String) -> URL? {
    Bundle.module.url(forResource: name, withExtension: "json", subdirectory: "Fixtures")
        ?? Bundle.module.url(forResource: name, withExtension: "json")
}

private func decodeFixture<T: Decodable>(_ name: String, as type: T.Type) throws -> T {
    let url = try XCTUnwrap(fixtureURL(name), "Missing fixture \\(name).json")
    return try JSONDecoder().decode(type, from: try Data(contentsOf: url))
}"""


def _render_case(type_name: str) -> str:
    return f"""\
func testDecodes{type_name}Example() throws {{
{indent(f"XCTAssertNoThrow(try decodeFixture({string_literal(type_name)}, as: {type_name}.self))")}
}}"""
