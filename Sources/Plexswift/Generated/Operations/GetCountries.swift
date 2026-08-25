// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint returns a list of countries which EPG data is available for. There are three
    /// flavors, as specfied by the `flavor` attribute
    public struct GetCountries: PlexOperation {
        public typealias Success = GetCountriesResponse

        public static let operationID = "getCountries"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/livetv/epg/countries" }
    }
}
