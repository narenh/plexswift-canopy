// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the artwork, thumb, element for a metadata item
    public struct GetItemArtwork: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getItemArtwork"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The type of artwork element (e.g., art, poster, thumb)
        public var element: GetItemArtworkElement

        /// A timestamp on the element used for cache management in the client
        public var timestamp: Int

        public init(
            ids: String,
            element: GetItemArtworkElement,
            timestamp: Int
        ) {
            self.ids = ids
            self.element = element
            self.timestamp = timestamp
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/\(PathComponent(element))/\(PathComponent(timestamp))" }
    }
}
