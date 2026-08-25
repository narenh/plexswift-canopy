// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of hubs including both built-in and custom
    public struct ListHubs: PlexOperation {
        public typealias Success = ListHubsResponse

        public static let operationID = "listHubs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section ID for the hubs to reorder
        public var sectionId: Int

        /// Restrict hubs to ones relevant to the provided metadata item
        public var metadataItemId: Int?

        public init(
            sectionId: Int,
            metadataItemId: Int? = nil
        ) {
            self.sectionId = sectionId
            self.metadataItemId = metadataItemId
        }

        public var path: String { "/hubs/sections/\(PathComponent(sectionId))/manage" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = metadataItemId {
                items.append(URLQueryItem(name: "metadataItemId", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
