// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Retrieves the play queue, centered at current item. This can be treated as a regular container
    /// by play queue-oblivious clients, but they may wish to request a large window onto the queue
    /// since they won't know to refresh.
    public struct GetPlayQueue: PlexOperation {
        public typealias Success = PlayQueueResponse

        public static let operationID = "getPlayQueue"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the play queue.
        public var playQueueId: Int

        /// If the server should transfer ownership to the requesting client (used in remote control
        /// scenarios).
        public var own: BoolInt?

        /// The play queue item ID for the center of the window - this doesn't change the current selected
        /// item.
        public var center: String?

        /// How many items on each side of the center of the window
        public var window: Int?

        /// Whether to include the items before the center (if 0, center is not included either), defaults
        /// to 1.
        public var includeBefore: BoolInt?

        /// Whether to include the items after the center (if 0, center is not included either), defaults to
        /// 1.
        public var includeAfter: BoolInt?

        public init(
            playQueueId: Int,
            own: BoolInt? = nil,
            center: String? = nil,
            window: Int? = nil,
            includeBefore: BoolInt? = nil,
            includeAfter: BoolInt? = nil
        ) {
            self.playQueueId = playQueueId
            self.own = own
            self.center = center
            self.window = window
            self.includeBefore = includeBefore
            self.includeAfter = includeAfter
        }

        public var path: String { "/playQueues/\(PathComponent(playQueueId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = own {
                items.append(URLQueryItem(name: "own", value: QueryValue(value).encoded))
            }
            if let value = center {
                items.append(URLQueryItem(name: "center", value: QueryValue(value).encoded))
            }
            if let value = window {
                items.append(URLQueryItem(name: "window", value: QueryValue(value).encoded))
            }
            if let value = includeBefore {
                items.append(URLQueryItem(name: "includeBefore", value: QueryValue(value).encoded))
            }
            if let value = includeAfter {
                items.append(URLQueryItem(name: "includeAfter", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
