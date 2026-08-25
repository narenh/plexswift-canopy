// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get BIF index for a part by index type
    public struct GetPartIndex: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getPartIndex"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The part id who's index is to be fetched
        public var partId: Int

        /// The type of index to grab.
        public var index: GetPartIndexIndex

        /// The interval between images to return in ms.
        public var interval: Int?

        public init(
            partId: Int,
            index: GetPartIndexIndex,
            interval: Int? = nil
        ) {
            self.partId = partId
            self.index = index
            self.interval = interval
        }

        public var path: String { "/library/parts/\(PathComponent(partId))/indexes/\(PathComponent(index))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = interval {
                items.append(URLQueryItem(name: "interval", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
