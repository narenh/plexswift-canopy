// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get GeoIP lookup information for the current request.
    public struct GetGeoIP: PlexOperation {
        public typealias Success = GeoIPResponse

        public static let operationID = "getGeoIP"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/geoip" }
    }
}
