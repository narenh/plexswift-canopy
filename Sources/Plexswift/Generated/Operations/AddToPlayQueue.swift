// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Adds an item to a play queue (e.g. party mode). Increments the version of the play queue. Takes
    /// the following parameters (`uri` and `playlistID` are mutually exclusive). Returns the modified
    /// play queue.
    public struct AddToPlayQueue: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "addToPlayQueue"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the play queue.
        public var playQueueId: Int

        /// The content URI for what we're adding to the queue.
        public var uri: String?

        /// The ID of the playlist to add to the playQueue.
        public var playlistID: String?

        /// Play this item next (defaults to 0 - queueing at the end of manually queued items).
        public var next: BoolInt?

        public init(
            playQueueId: Int,
            uri: String? = nil,
            playlistID: String? = nil,
            next: BoolInt? = nil
        ) {
            self.playQueueId = playQueueId
            self.uri = uri
            self.playlistID = playlistID
            self.next = next
        }

        public var path: String { "/playQueues/\(PathComponent(playQueueId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = uri {
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            if let value = playlistID {
                items.append(URLQueryItem(name: "playlistID", value: QueryValue(value).encoded))
            }
            if let value = next {
                items.append(URLQueryItem(name: "next", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
