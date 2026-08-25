// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct EPGCountry: Codable, Hashable, Sendable {
    public let title: String?

    public let type: String?

    /// Three letter code
    public let code: String?

    /// - `0`: The country is divided into regions, and following the key will lead to a list of regions.
    /// - `1`: The county is divided by postal codes, and an example code is returned in `example`.
    /// - `2`: The country has a single postal code, returned in `example`.
    public let flavor: EPGCountryFlavor?

    public let key: String?

    /// Three letter language code
    public let language: String?

    /// The title of the language
    public let languageTitle: String?

    public init(
        title: String? = nil,
        type: String? = nil,
        code: String? = nil,
        flavor: EPGCountryFlavor? = nil,
        key: String? = nil,
        language: String? = nil,
        languageTitle: String? = nil
    ) {
        self.title = title
        self.type = type
        self.code = code
        self.flavor = flavor
        self.key = key
        self.language = language
        self.languageTitle = languageTitle
    }
}
