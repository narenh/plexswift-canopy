// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of all preferences
    public struct GetAllPreferences: PlexOperation {
        public typealias Success = MediaContainerWithSettings

        public static let operationID = "getAllPreferences"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/:/prefs" }
    }
}
