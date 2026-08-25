// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Create a marker for this user on the metadata item
    public struct CreateMarker: PlexOperation {
        public typealias Success = CreateMarkerResponse

        public static let operationID = "createMarker"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The type of marker to edit/create
        public var type: Int

        /// The start time of the marker
        public var startTimeOffset: Int

        /// The end time of the marker
        public var endTimeOffset: Int?

        /// The attributes to assign to this marker
        public var attributes: AnyJSON?

        public init(
            ids: String,
            type: Int,
            startTimeOffset: Int,
            endTimeOffset: Int? = nil,
            attributes: AnyJSON? = nil
        ) {
            self.ids = ids
            self.type = type
            self.startTimeOffset = startTimeOffset
            self.endTimeOffset = endTimeOffset
            self.attributes = attributes
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/marker" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = type
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            do {
                let value = startTimeOffset
                items.append(URLQueryItem(name: "startTimeOffset", value: QueryValue(value).encoded))
            }
            if let value = endTimeOffset {
                items.append(URLQueryItem(name: "endTimeOffset", value: QueryValue(value).encoded))
            }
            if let value = attributes {
                items.append(URLQueryItem(name: "attributes", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
