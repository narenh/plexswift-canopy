// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Rate the currently playing item.
    public struct PlayerSetRating: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerSetRating"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The rating value to set
        public var rating: Int?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            rating: Int? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.rating = rating
        }

        public var path: String { "/player/playback/setRating" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = rating {
                items.append(URLQueryItem(name: "rating", value: QueryValue(value).encoded))
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
