// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Claim the local PMS server using a claim token obtained from plex.tv.
    public struct ClaimServer: PlexOperation {
        public typealias Success = ClaimTokenResponse

        public static let operationID = "claimServer"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/myplex/claim" }
    }
}
