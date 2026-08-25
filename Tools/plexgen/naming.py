"""Deriving Swift identifiers from OpenAPI names.

Naming is kept in one place, and free of any dependency on the spec or the emitter, because
it is the part of generation most likely to need adjusting and the easiest to get subtly
wrong. Every function here is a pure string transformation covered by ``tests/test_naming.py``.
"""

from __future__ import annotations

import re

# Words that Swift reserves and that therefore need backticks when used as an identifier.
# Only those that can plausibly collide with a Plex property or type name are listed; the
# escaping is applied uniformly, so a missing entry shows up as a compile error rather than
# as wrong behaviour.
SWIFT_KEYWORDS = frozenset(
    """
    associatedtype class deinit enum extension fileprivate func import init inout internal let
    open operator private precedencegroup protocol public rethrows static struct subscript
    typealias var break case catch continue default defer do else fallthrough for guard if in
    repeat return throw switch where while as any await catch false is nil rethrows self Self
    super throws true try Type Protocol associativity convenience didSet dynamic final get
    indirect infix lazy left mutating none nonmutating optional override postfix precedence
    prefix required right set some unowned weak willSet actor async isolated nonisolated
    """.split()
)

# Identifiers that are legal Swift but would shadow something the generated code relies on.
SHADOWING_NAMES = frozenset({"Self", "Type", "Protocol", "Any", "AnyObject"})

# Type names the generated models themselves refer to. A schema called "Data" would emit
# `public struct Data` into the same module, and every `Data` in a generated file would then
# resolve to it instead of `Foundation.Data`, so these get a suffix.
#
# Names the *handwritten* runtime depends on are not listed. A schema called `Error` is fine,
# because the runtime spells that dependency `Swift.Error`; qualifying at the point of use is
# better than renaming a type the API actually has.
RESERVED_TYPE_NAMES = frozenset(
    {
        "AnyJSON",
        "Bool",
        "CodingKey",
        "Data",
        "Date",
        "Decodable",
        "Decoder",
        "DecodingError",
        "Double",
        "Encodable",
        "Encoder",
        "EncodingError",
        "Hashable",
        "Int",
        "JSONDecoder",
        "JSONEncoder",
        "Sendable",
        "String",
        "URL",
    }
)

# Plex's JSON mixes conventions freely (``librarySectionID`` next to ``ratingKey``), so the
# general rule is to split on separators and case boundaries and normalise only the first
# character. That rule mis-splits acronyms whose expansion continues in lower case — "IPv6"
# would become "I" + "Pv6", giving the property name ``iPv6`` — so the acronyms the spec
# actually uses are matched first, longest one wins.
KNOWN_ACRONYMS = (
    "IPv4",
    "IPv6",
    "HTTPS",
    "HTTP",
    "UUID",
    "JSON",
    "XML",
    "URL",
    "URI",
    "API",
    "DVR",
    "EPG",
    "DOVI",
    "UHD",
    "ID",
    "IP",
    "TV",
    "HD",
    "SD",
)

_NON_IDENTIFIER = re.compile(r"[^0-9a-zA-Z]+")
_LEADING_DIGITS = re.compile(r"^[0-9]")
_WORD = re.compile(r"[A-Z]+(?![a-z])|[A-Z][a-z0-9]*|[a-z0-9]+")


def _split_words(value: str) -> list[str]:
    """Splits ``value`` into words on separators and camelCase boundaries.

    >>> _split_words("librarySectionID")
    ['library', 'Section', 'ID']
    >>> _split_words("IPv6Gateway")
    ['IPv6', 'Gateway']
    """
    words: list[str] = []
    for part in (part for part in _NON_IDENTIFIER.split(value) if part):
        position = 0
        while position < len(part):
            acronym = next(
                (a for a in KNOWN_ACRONYMS if part.startswith(a, position)),
                None,
            )
            if acronym is not None:
                words.append(acronym)
                position += len(acronym)
                continue
            match = _WORD.match(part, position)
            if match is None:
                position += 1
                continue
            words.append(match.group())
            position = match.end()
    return words


def pascal_case(value: str) -> str:
    """Converts ``value`` to UpperCamelCase, preserving acronym runs.

    >>> pascal_case("get-library-items")
    'GetLibraryItems'
    >>> pascal_case("MediaContainerWithDirectory")
    'MediaContainerWithDirectory'
    """
    words = _split_words(value)
    if not words:
        return ""
    return "".join(word if word.isupper() else word[:1].upper() + word[1:] for word in words)


def camel_case(value: str) -> str:
    """Converts ``value`` to lowerCamelCase.

    A leading acronym is lowercased in full so that ``URLString`` becomes ``urlString`` rather
    than ``uRLString``.

    >>> camel_case("MediaContainer")
    'mediaContainer'
    >>> camel_case("X-Plex-Token")
    'xPlexToken'
    >>> camel_case("URLString")
    'urlString'
    """
    words = _split_words(value)
    if not words:
        return ""
    first, rest = words[0], words[1:]
    head = first.lower()
    tail = "".join(word if word.isupper() else word[:1].upper() + word[1:] for word in rest)
    return head + tail


def escape_identifier(name: str) -> str:
    """Wraps ``name`` in backticks if Swift would otherwise reject or misread it."""
    if name in SWIFT_KEYWORDS or name in SHADOWING_NAMES:
        return f"`{name}`"
    return name


def type_name(value: str) -> str:
    """The Swift type name for a schema called ``value``."""
    name = pascal_case(value)
    if not name:
        raise ValueError("Cannot derive a Swift type name from an empty string")
    if _LEADING_DIGITS.match(name):
        name = f"_{name}"
    if name in SHADOWING_NAMES or name in RESERVED_TYPE_NAMES:
        name = f"{name}Value"
    return name


def property_name(value: str) -> str:
    """The Swift property name for a JSON key called ``value``."""
    name = camel_case(value)
    if not name:
        raise ValueError("Cannot derive a Swift property name from an empty string")
    if _LEADING_DIGITS.match(name):
        name = f"_{name}"
    return escape_identifier(name)


def enum_case_name(value: object) -> str:
    """The Swift case name for an enum value.

    Numeric values become ``case n42`` / ``case nMinus1`` since a case cannot start with a
    digit or a hyphen, and string values become lowerCamelCase.

    >>> enum_case_name("coverPoster")
    'coverPoster'
    >>> enum_case_name(-1)
    'nMinus1'
    """
    if isinstance(value, bool):
        return "yes" if value else "no"
    if isinstance(value, int):
        return f"nMinus{abs(value)}" if value < 0 else f"n{value}"
    if isinstance(value, float):
        return "n" + str(value).replace(".", "_").replace("-", "Minus")

    text = str(value)
    if not text:
        return "empty"
    name = camel_case(text)
    if not name:
        # The value was entirely punctuation, e.g. "*".
        name = "value" + "".join(f"_{ord(char)}" for char in text)
    if _LEADING_DIGITS.match(name):
        name = f"n{name}"
    return escape_identifier(name)


def disambiguate(name: str, taken: set[str]) -> str:
    """Returns ``name``, or ``name`` with a numeric suffix if it is already ``taken``.

    The returned name is added to ``taken`` so that repeated calls keep producing distinct
    names. Generation is deterministic because callers iterate the spec in document order.
    """
    if name not in taken:
        taken.add(name)
        return name
    index = 2
    while f"{name}{index}" in taken:
        index += 1
    result = f"{name}{index}"
    taken.add(result)
    return result
