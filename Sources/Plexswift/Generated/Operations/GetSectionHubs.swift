// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the hubs for a single section
    public struct GetSectionHubs: PlexOperation {
        public typealias Success = MediaContainerWithHubs

        public static let operationID = "getSectionHubs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Limit results to count items
        public var count: Int?

        /// The section ID for the hubs to fetch
        public var sectionId: Int

        /// Only return hubs which are "transient", meaning those which are prone to changing after media
        /// playback or addition (e.g. On Deck, or Recently Added)
        public var onlyTransient: BoolInt?

        public init(
            count: Int? = nil,
            sectionId: Int,
            onlyTransient: BoolInt? = nil
        ) {
            self.count = count
            self.sectionId = sectionId
            self.onlyTransient = onlyTransient
        }

        public var path: String { "/hubs/sections/\(PathComponent(sectionId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            if let value = onlyTransient {
                items.append(URLQueryItem(name: "onlyTransient", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
