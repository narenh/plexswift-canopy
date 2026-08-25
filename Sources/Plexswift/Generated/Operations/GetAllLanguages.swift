// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Returns a list of all possible languages for EPG data.
    public struct GetAllLanguages: PlexOperation {
        public typealias Success = GetAllLanguagesResponse

        public static let operationID = "getAllLanguages"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/livetv/epg/languages" }
    }
}
