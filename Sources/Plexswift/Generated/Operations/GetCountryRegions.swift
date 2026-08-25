// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get regions for a country within an EPG provider
    public struct GetCountryRegions: PlexOperation {
        public typealias Success = GetCountryRegionsResponse

        public static let operationID = "getCountryRegions"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// 3 letter country code
        public var country: String

        /// The `providerIdentifier` of the provider
        public var epgId: String

        public init(
            country: String,
            epgId: String
        ) {
            self.country = country
            self.epgId = epgId
        }

        public var path: String { "/livetv/epg/countries/\(PathComponent(country))/\(PathComponent(epgId))/regions" }
    }
}
