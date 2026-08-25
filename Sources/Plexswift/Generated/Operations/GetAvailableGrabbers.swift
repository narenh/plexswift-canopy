// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get available grabbers visible to the server
    public struct GetAvailableGrabbers: PlexOperation {
        public typealias Success = GetAvailableGrabbersResponse

        public static let operationID = "getAvailableGrabbers"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Only return grabbers providing this protocol.
        public var `protocol`: String?

        public init(
            protocol: String? = nil
        ) {
            self.`protocol` = `protocol`
        }

        public var path: String { "/media/grabbers" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = `protocol` {
                items.append(URLQueryItem(name: "protocol", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
