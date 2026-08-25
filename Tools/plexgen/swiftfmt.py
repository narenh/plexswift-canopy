"""Small helpers for producing readable Swift source.

Formatting lives here rather than being spread through the emitters so that the shape of the
generated code can be adjusted in one place.
"""

from __future__ import annotations

import re

INDENT = "    "
LINE_LIMIT = 100

GENERATED_HEADER = """\
// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.
"""


def indent(text: str, level: int = 1) -> str:
    """Indents every non-empty line of ``text`` by ``level`` steps."""
    prefix = INDENT * level
    return "\n".join(prefix + line if line.strip() else line for line in text.split("\n"))


def documentation(text: str | None, width: int = LINE_LIMIT - 4) -> list[str]:
    """Renders ``text`` as `///` documentation lines.

    Paragraph breaks are preserved, and lines that already look like Markdown structure —
    lists, tables, headings, fenced code — are passed through unwrapped so their layout
    survives.
    """
    if not text:
        return []

    lines: list[str] = []
    in_fence = False
    for raw in text.strip().split("\n"):
        stripped = raw.strip()

        if stripped.startswith("```"):
            in_fence = not in_fence
            lines.append(f"/// {stripped}")
            continue

        if in_fence:
            lines.append(f"/// {raw}" if raw else "///")
            continue

        if not stripped:
            lines.append("///")
            continue

        if _is_structural(stripped):
            lines.append(f"/// {stripped}")
            continue

        lines.extend(f"/// {line}" for line in _wrap(stripped, width))

    # Collapse the runs of blank comment lines that paragraph breaks can leave behind.
    result: list[str] = []
    for line in lines:
        if line == "///" and result and result[-1] == "///":
            continue
        result.append(line)
    while result and result[-1] == "///":
        result.pop()
    while result and result[0] == "///":
        result.pop(0)
    return result


_STRUCTURAL = re.compile(r"^(\s*([-*+>|]|\d+\.|#{1,6})\s|\||\s{4,}\S)")


def _is_structural(line: str) -> bool:
    return bool(_STRUCTURAL.match(line))


def _wrap(text: str, width: int) -> list[str]:
    words = text.split()
    if not words:
        return [""]
    lines: list[str] = []
    current = words[0]
    for word in words[1:]:
        if len(current) + 1 + len(word) <= width:
            current = f"{current} {word}"
        else:
            lines.append(current)
            current = word
    lines.append(current)
    return lines


def string_literal(value: str) -> str:
    """Renders ``value`` as a Swift string literal."""
    escaped = (
        value.replace("\\", "\\\\")
        .replace('"', '\\"')
        .replace("\n", "\\n")
        .replace("\r", "\\r")
        .replace("\t", "\\t")
    )
    return f'"{escaped}"'


def raw_value_literal(value: object) -> str:
    """Renders an enum's raw value as a Swift literal."""
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return str(value)
    return string_literal(str(value))


def availability(deprecated: bool, message: str = "This operation is deprecated in the Plex API.") -> list[str]:
    """The `@available` attribute for a deprecated declaration."""
    if not deprecated:
        return []
    return [f"@available(*, deprecated, message: {string_literal(message)})"]


def file_contents(body: str) -> str:
    """Wraps ``body`` in the generated-file header and normalises trailing whitespace."""
    lines = [line.rstrip() for line in body.rstrip().split("\n")]
    return GENERATED_HEADER + "\n" + "\n".join(lines) + "\n"
