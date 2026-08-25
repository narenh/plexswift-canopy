// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get lineups for a region within an EPG provider
    public struct ListLineups: PlexOperation {
        public typealias Success = MediaContainerWithLineup

        public static let operationID = "listLineups"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// 3 letter country code
        public var country: String

        /// The `providerIdentifier` of the provider
        public var epgId: String

        /// The region for the lineup
        public var region: String

        public init(
            country: String,
            epgId: String,
            region: String
        ) {
            self.country = country
            self.epgId = epgId
            self.region = region
        }

        public var path: String { "/livetv/epg/countries/\(PathComponent(country))/\(PathComponent(epgId))/regions/\(PathComponent(region))/lineups" }
    }
}
