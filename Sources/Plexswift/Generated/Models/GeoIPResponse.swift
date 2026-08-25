// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GeoIPResponse: Codable, Hashable, Sendable {
    public let city: String?

    public let coordinates: String?

    public let country: String?

    public let countryCode: String?

    public let subdivisions: String?

    public let timezone: String?

    public init(
        city: String? = nil,
        coordinates: String? = nil,
        country: String? = nil,
        countryCode: String? = nil,
        subdivisions: String? = nil,
        timezone: String? = nil
    ) {
        self.city = city
        self.coordinates = coordinates
        self.country = country
        self.countryCode = countryCode
        self.subdivisions = subdivisions
        self.timezone = timezone
    }

    private enum CodingKeys: String, CodingKey {
        case city
        case coordinates
        case country
        case countryCode = "country_code"
        case subdivisions
        case timezone
    }
}
