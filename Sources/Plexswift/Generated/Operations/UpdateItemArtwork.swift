// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the artwork, thumb, element for a metadata item
    /// Generally only the admin can perform this action. The exception is if the metadata is a playlist
    /// created by the user
    public struct UpdateItemArtwork: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "updateItemArtwork"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The type of artwork element (e.g., art, poster, thumb)
        public var element: UpdateItemArtworkElement

        /// The url of the new asset.
        public var url: String?

        public init(
            ids: String,
            element: UpdateItemArtworkElement,
            url: String? = nil
        ) {
            self.ids = ids
            self.element = element
            self.url = url
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/\(PathComponent(element))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = url {
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
