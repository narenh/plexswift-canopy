// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the resume offset for the current item.
    public struct PlayerSetViewOffset: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerSetViewOffset"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The byte offset for stream seeking
        public var offset: Int?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            offset: Int? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.offset = offset
        }

        public var path: String { "/player/playback/setViewOffset" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = offset {
                items.append(URLQueryItem(name: "offset", value: QueryValue(value).encoded))
            }
            return items
        }

        public var headers: [String: String] {
            var headers: [String: String] = [:]
            if let value = xPlexTargetClientIdentifier {
                headers["X-Plex-Target-Client-Identifier"] = QueryValue(value).encoded
            }
            return headers
        }
    }
}
