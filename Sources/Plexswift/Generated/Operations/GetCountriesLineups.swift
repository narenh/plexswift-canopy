// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Returns a list of lineups for a given country, EPG provider and postal code
    public struct GetCountriesLineups: PlexOperation {
        public typealias Success = MediaContainerWithLineup

        public static let operationID = "getCountriesLineups"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// 3 letter country code
        public var country: String

        /// The `providerIdentifier` of the provider
        public var epgId: String

        /// The postal code for the lineups to fetch
        public var postalCode: String?

        public init(
            country: String,
            epgId: String,
            postalCode: String? = nil
        ) {
            self.country = country
            self.epgId = epgId
            self.postalCode = postalCode
        }

        public var path: String { "/livetv/epg/countries/\(PathComponent(country))/\(PathComponent(epgId))/lineups" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = postalCode {
                items.append(URLQueryItem(name: "postalCode", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
