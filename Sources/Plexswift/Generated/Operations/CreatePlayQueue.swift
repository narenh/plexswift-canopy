// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Makes a new play queue for a device. The source of the playqueue can either be a URI, or a
    /// playlist. The response is a media container with the initial items in the queue. Each item in
    /// the queue will be a regular item but with `playQueueItemID` - a unique ID since the queue could
    /// have repeated items with the same `ratingKey`.
    /// Note: Either `uri` or `playlistID` must be specified
    public struct CreatePlayQueue: PlexOperation {
        public typealias Success = MediaContainerWithPlayQueue

        public static let operationID = "createPlayQueue"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The content URI for what we're playing.
        public var uri: String?

        /// the ID of the playlist we're playing.
        public var playlistID: Int?

        /// The type of play queue to create
        public var type: CreatePlayQueueType

        /// The key of the first item to play, defaults to the first in the play queue.
        public var key: String?

        /// Whether to shuffle the playlist, defaults to 0.
        public var shuffle: BoolInt?

        /// If the PQ is bigger than the window, fill any empty space with wraparound items, defaults to 0.
        public var `repeat`: BoolInt?

        /// Whether to create a continuous play queue (e.g. from an episode), defaults to 0.
        public var continuous: BoolInt?

        /// Number of trailers to prepend a movie with not including the pre-roll. If omitted the pre-roll
        /// will not be returned in the play queue. When resuming a movie `extrasPrefixCount` should be
        /// omitted as a parameter instead of passing 0.
        public var extrasPrefixCount: Int?

        /// Only applies to queues of type photo, whether to retrieve all descendent photos from an album or
        /// section, defaults to 1.
        public var recursive: BoolInt?

        /// Only applies to queues of type show or seasons, whether to return a queue that is started on the
        /// On Deck episode if one exists. Otherwise begins the play queue on the beginning of the show or
        /// season.
        public var onDeck: BoolInt?

        public init(
            uri: String? = nil,
            playlistID: Int? = nil,
            type: CreatePlayQueueType,
            key: String? = nil,
            shuffle: BoolInt? = nil,
            repeat: BoolInt? = nil,
            continuous: BoolInt? = nil,
            extrasPrefixCount: Int? = nil,
            recursive: BoolInt? = nil,
            onDeck: BoolInt? = nil
        ) {
            self.uri = uri
            self.playlistID = playlistID
            self.type = type
            self.key = key
            self.shuffle = shuffle
            self.`repeat` = `repeat`
            self.continuous = continuous
            self.extrasPrefixCount = extrasPrefixCount
            self.recursive = recursive
            self.onDeck = onDeck
        }

        public var path: String { "/playQueues" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = uri {
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            if let value = playlistID {
                items.append(URLQueryItem(name: "playlistID", value: QueryValue(value).encoded))
            }
            do {
                let value = type
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            if let value = key {
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
            }
            if let value = shuffle {
                items.append(URLQueryItem(name: "shuffle", value: QueryValue(value).encoded))
            }
            if let value = `repeat` {
                items.append(URLQueryItem(name: "repeat", value: QueryValue(value).encoded))
            }
            if let value = continuous {
                items.append(URLQueryItem(name: "continuous", value: QueryValue(value).encoded))
            }
            if let value = extrasPrefixCount {
                items.append(URLQueryItem(name: "extrasPrefixCount", value: QueryValue(value).encoded))
            }
            if let value = recursive {
                items.append(URLQueryItem(name: "recursive", value: QueryValue(value).encoded))
            }
            if let value = onDeck {
                items.append(URLQueryItem(name: "onDeck", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
