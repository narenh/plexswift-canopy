// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of all available media providers for this PMS. This will generally include the
    /// library provider and possibly EPG if DVR is set up.
    public struct ListProviders: PlexOperation {
        public typealias Success = ListProvidersResponse

        public static let operationID = "listProviders"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/media/providers" }
    }
}
