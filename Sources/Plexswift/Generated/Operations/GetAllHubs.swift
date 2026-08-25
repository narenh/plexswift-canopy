// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the global hubs in this PMS
    public struct GetAllHubs: PlexOperation {
        public typealias Success = MediaContainerWithHubs

        public static let operationID = "getAllHubs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Limit results to count items
        public var count: Int?

        /// Only return hubs which are "transient", meaning those which are prone to changing after media
        /// playback or addition (e.g. On Deck, or Recently Added)
        public var onlyTransient: BoolInt?

        /// If provided, limit to only specified hubs
        public var identifier: [String]?

        public init(
            count: Int? = nil,
            onlyTransient: BoolInt? = nil,
            identifier: [String]? = nil
        ) {
            self.count = count
            self.onlyTransient = onlyTransient
            self.identifier = identifier
        }

        public var path: String { "/hubs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            if let value = onlyTransient {
                items.append(URLQueryItem(name: "onlyTransient", value: QueryValue(value).encoded))
            }
            if let value = identifier {
                for element in value {
                    items.append(URLQueryItem(name: "identifier", value: QueryValue(element).encoded))
                }
            }
            return items
        }
    }
}
