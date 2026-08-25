// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get client capabilities and device info.
    public struct GetClientResources: PlexOperation {
        public typealias Success = MediaContainerWithDevice

        public static let operationID = "getClientResources"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        public init(
            xPlexTargetClientIdentifier: String? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
        }

        public var path: String { "/player/resources" }

        public var headers: [String: String] {
            var headers: [String: String] = [:]
            if let value = xPlexTargetClientIdentifier {
                headers["X-Plex-Target-Client-Identifier"] = QueryValue(value).encoded
            }
            return headers
        }
    }
}
