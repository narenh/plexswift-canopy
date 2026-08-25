// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the artwork, thumb, element for a metadata item
    /// Generally only the admin can perform this action. The exception is if the metadata is a playlist
    /// created by the user
    public struct SetItemArtwork: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "setItemArtwork"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The type of artwork element (e.g., art, poster, thumb)
        public var element: SetItemArtworkElement

        /// The url of the new asset. If not provided, the binary of the asset must be provided in the post
        /// body.
        public var url: String?

        public init(
            ids: String,
            element: SetItemArtworkElement,
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
