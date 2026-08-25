// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint registers a media provider with the server. Once registered, the media server acts
    /// as a reverse proxy to the provider, allowing both local and remote providers to work.
    public struct AddProvider: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "addProvider"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The URL of the media provider to add.
        public var url: String

        public init(
            url: String
        ) {
            self.url = url
        }

        public var path: String { "/media/providers" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = url
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
