// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a list of audio tracks starting at one and ending at another which are similar across the
    /// path
    public struct GetSonicPath: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getSonicPath"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Limit results to count items
        public var count: Int?

        /// Section identifier
        public var sectionId: Int

        /// The starting metadata item id
        public var startID: Int

        /// The ending metadata item id
        public var endID: Int

        /// The maximum distance allowed along the path; defaults to 0.25
        public var maxDistance: Double?

        public init(
            count: Int? = nil,
            sectionId: Int,
            startID: Int,
            endID: Int,
            maxDistance: Double? = nil
        ) {
            self.count = count
            self.sectionId = sectionId
            self.startID = startID
            self.endID = endID
            self.maxDistance = maxDistance
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/computePath" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            do {
                let value = startID
                items.append(URLQueryItem(name: "startID", value: QueryValue(value).encoded))
            }
            do {
                let value = endID
                items.append(URLQueryItem(name: "endID", value: QueryValue(value).encoded))
            }
            if let value = maxDistance {
                items.append(URLQueryItem(name: "maxDistance", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
