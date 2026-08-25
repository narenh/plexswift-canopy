import unittest

from plexgen.naming import (
    camel_case,
    disambiguate,
    enum_case_name,
    escape_identifier,
    pascal_case,
    property_name,
    type_name,
)


class PascalCaseTests(unittest.TestCase):
    def test_splits_on_separators(self):
        self.assertEqual(pascal_case("get-library-items"), "GetLibraryItems")
        self.assertEqual(pascal_case("get_library_items"), "GetLibraryItems")
        self.assertEqual(pascal_case("get library items"), "GetLibraryItems")

    def test_leaves_pascal_case_untouched(self):
        self.assertEqual(pascal_case("MediaContainerWithDirectory"), "MediaContainerWithDirectory")

    def test_promotes_camel_case(self):
        self.assertEqual(pascal_case("mediaContainer"), "MediaContainer")

    def test_preserves_acronym_runs(self):
        self.assertEqual(pascal_case("librarySectionID"), "LibrarySectionID")
        self.assertEqual(pascal_case("parseURLString"), "ParseURLString")

    def test_handles_digits(self):
        self.assertEqual(pascal_case("oauth2Token"), "Oauth2Token")

    def test_empty_input_yields_empty_string(self):
        self.assertEqual(pascal_case("---"), "")


class CamelCaseTests(unittest.TestCase):
    def test_demotes_pascal_case(self):
        self.assertEqual(camel_case("MediaContainer"), "mediaContainer")

    def test_splits_header_style_names(self):
        self.assertEqual(camel_case("X-Plex-Token"), "xPlexToken")
        self.assertEqual(camel_case("X-Plex-Client-Identifier"), "xPlexClientIdentifier")

    def test_lowercases_a_leading_acronym_in_full(self):
        self.assertEqual(camel_case("URLString"), "urlString")
        self.assertEqual(camel_case("DVR"), "dvr")

    def test_preserves_a_trailing_acronym(self):
        self.assertEqual(camel_case("librarySectionID"), "librarySectionID")

    def test_handles_acronyms_whose_expansion_continues_in_lower_case(self):
        # Without the known-acronym table these split as "I" + "Pv6", giving "iPv6".
        self.assertEqual(camel_case("IPv6"), "ipv6")
        self.assertEqual(camel_case("IPv4Address"), "ipv4Address")

    def test_handles_the_property_names_the_spec_actually_uses(self):
        # DOVI BL is Dolby Vision's base layer, so the acronyms split apart.
        self.assertEqual(camel_case("DOVIBLCompatID"), "doviBLCompatID")
        self.assertEqual(camel_case("DOVIPresent"), "doviPresent")
        self.assertEqual(camel_case("ratingKey"), "ratingKey")

    def test_is_idempotent(self):
        for value in ["ratingKey", "librarySectionID", "urlString"]:
            self.assertEqual(camel_case(camel_case(value)), camel_case(value))


class EscapeIdentifierTests(unittest.TestCase):
    def test_escapes_keywords(self):
        self.assertEqual(escape_identifier("default"), "`default`")
        self.assertEqual(escape_identifier("protocol"), "`protocol`")
        self.assertEqual(escape_identifier("guard"), "`guard`")

    def test_escapes_shadowing_names(self):
        self.assertEqual(escape_identifier("Type"), "`Type`")

    def test_leaves_ordinary_names_alone(self):
        self.assertEqual(escape_identifier("ratingKey"), "ratingKey")


class TypeNameTests(unittest.TestCase):
    def test_derives_pascal_case(self):
        self.assertEqual(type_name("media-container"), "MediaContainer")

    def test_prefixes_leading_digits(self):
        self.assertEqual(type_name("400Response"), "_400Response")

    def test_avoids_shadowing_swift_builtins(self):
        self.assertEqual(type_name("Type"), "TypeValue")
        self.assertEqual(type_name("Any"), "AnyValue")

    def test_rejects_empty_names(self):
        with self.assertRaises(ValueError):
            type_name("!!!")


class PropertyNameTests(unittest.TestCase):
    def test_derives_camel_case(self):
        self.assertEqual(property_name("rating_key"), "ratingKey")

    def test_escapes_keywords(self):
        self.assertEqual(property_name("default"), "`default`")
        self.assertEqual(property_name("type"), "type")

    def test_prefixes_leading_digits(self):
        self.assertEqual(property_name("3d"), "_3d")


class EnumCaseNameTests(unittest.TestCase):
    def test_string_values_become_camel_case(self):
        self.assertEqual(enum_case_name("coverPoster"), "coverPoster")
        self.assertEqual(enum_case_name("background-square"), "backgroundSquare")

    def test_integers_are_prefixed(self):
        self.assertEqual(enum_case_name(42), "n42")

    def test_negative_integers_spell_out_the_sign(self):
        self.assertEqual(enum_case_name(-1), "nMinus1")

    def test_booleans(self):
        self.assertEqual(enum_case_name(True), "yes")
        self.assertEqual(enum_case_name(False), "no")

    def test_keywords_are_escaped(self):
        self.assertEqual(enum_case_name("default"), "`default`")

    def test_empty_string(self):
        self.assertEqual(enum_case_name(""), "empty")

    def test_punctuation_only_values_are_still_valid_identifiers(self):
        self.assertEqual(enum_case_name("*"), "value_42")

    def test_values_starting_with_a_digit(self):
        self.assertEqual(enum_case_name("1080p"), "n1080p")


class DisambiguateTests(unittest.TestCase):
    def test_returns_the_name_when_free(self):
        taken = set()
        self.assertEqual(disambiguate("Metadata", taken), "Metadata")
        self.assertEqual(taken, {"Metadata"})

    def test_suffixes_on_collision(self):
        taken = {"Metadata"}
        self.assertEqual(disambiguate("Metadata", taken), "Metadata2")
        self.assertEqual(disambiguate("Metadata", taken), "Metadata3")

    def test_skips_suffixes_already_in_use(self):
        taken = {"Metadata", "Metadata2"}
        self.assertEqual(disambiguate("Metadata", taken), "Metadata3")


if __name__ == "__main__":
    unittest.main()
