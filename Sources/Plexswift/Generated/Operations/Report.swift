// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint is hit during media playback for an item. It must be hit whenever the play state
    /// changes, or in the absence of a play state change, in a regular fashion (generally this means
    /// every 10 seconds on a LAN/WAN, and every 20 seconds over cellular).
    public struct Report: PlexOperation {
        public typealias Success = ReportResponse

        public static let operationID = "report"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The details key for the item.
        public var key: String?

        /// The rating key attribute for the item.
        public var ratingKey: String?

        /// The current state of the media.
        public var state: ReportState?

        /// If playing media from a play queue, the play queue's ID.
        public var playQueueItemID: String?

        /// The current time offset of playback in ms.
        public var time: Int?

        /// The total duration of the item in ms.
        public var duration: Int?

        /// When state is `stopped`, a flag indicating whether or not the client is going to continue
        /// playing anothe item.
        public var continuing: BoolInt?

        /// Used when a sync client comes online and is syncing media timelines, holds the time at which the
        /// playback state was last updated.
        public var updated: Int?

        /// Also used by sync clients, used to indicate that a timeline is being synced from being offline,
        /// as opposed to being "live".
        public var offline: BoolInt?

        /// Time in seconds till first frame is displayed. Sent only on the first playing timeline request.
        public var timeToFirstFrame: Int?

        /// Time in seconds spent buffering since last request.
        public var timeStalled: Int?

        /// Bandwidth in kbps as estimated by the client.
        public var bandwidth: Int?

        /// Amount of time in seconds buffered by client. Omit if computed by `bufferedSize` below.
        public var bufferedTime: Int?

        /// Size in kilobytes of data buffered by client. Omit if computed by `bufferedTime` above
        public var bufferedSize: Int?

        /// Groups timeline reports (e.g. /playQueues/123).
        public var containerKey: String?

        /// Global unique identifier for the item.
        public var guid: String?

        /// Identifies the play queue itself (distinct from playQueueItemID).
        public var playQueueID: Int?

        /// Alternative to key/ratingKey (legacy).
        public var url: String?

        /// Unique per client playback session. Used if a client can playback multiple items at a time (such
        /// as a browser with multiple tabs)
        public var xPlexSessionIdentifier: String?

        public init(
            key: String? = nil,
            ratingKey: String? = nil,
            state: ReportState? = nil,
            playQueueItemID: String? = nil,
            time: Int? = nil,
            duration: Int? = nil,
            continuing: BoolInt? = nil,
            updated: Int? = nil,
            offline: BoolInt? = nil,
            timeToFirstFrame: Int? = nil,
            timeStalled: Int? = nil,
            bandwidth: Int? = nil,
            bufferedTime: Int? = nil,
            bufferedSize: Int? = nil,
            containerKey: String? = nil,
            guid: String? = nil,
            playQueueID: Int? = nil,
            url: String? = nil,
            xPlexSessionIdentifier: String? = nil
        ) {
            self.key = key
            self.ratingKey = ratingKey
            self.state = state
            self.playQueueItemID = playQueueItemID
            self.time = time
            self.duration = duration
            self.continuing = continuing
            self.updated = updated
            self.offline = offline
            self.timeToFirstFrame = timeToFirstFrame
            self.timeStalled = timeStalled
            self.bandwidth = bandwidth
            self.bufferedTime = bufferedTime
            self.bufferedSize = bufferedSize
            self.containerKey = containerKey
            self.guid = guid
            self.playQueueID = playQueueID
            self.url = url
            self.xPlexSessionIdentifier = xPlexSessionIdentifier
        }

        public var path: String { "/:/timeline" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = key {
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
            }
            if let value = ratingKey {
                items.append(URLQueryItem(name: "ratingKey", value: QueryValue(value).encoded))
            }
            if let value = state {
                items.append(URLQueryItem(name: "state", value: QueryValue(value).encoded))
            }
            if let value = playQueueItemID {
                items.append(URLQueryItem(name: "playQueueItemID", value: QueryValue(value).encoded))
            }
            if let value = time {
                items.append(URLQueryItem(name: "time", value: QueryValue(value).encoded))
            }
            if let value = duration {
                items.append(URLQueryItem(name: "duration", value: QueryValue(value).encoded))
            }
            if let value = continuing {
                items.append(URLQueryItem(name: "continuing", value: QueryValue(value).encoded))
            }
            if let value = updated {
                items.append(URLQueryItem(name: "updated", value: QueryValue(value).encoded))
            }
            if let value = offline {
                items.append(URLQueryItem(name: "offline", value: QueryValue(value).encoded))
            }
            if let value = timeToFirstFrame {
                items.append(URLQueryItem(name: "timeToFirstFrame", value: QueryValue(value).encoded))
            }
            if let value = timeStalled {
                items.append(URLQueryItem(name: "timeStalled", value: QueryValue(value).encoded))
            }
            if let value = bandwidth {
                items.append(URLQueryItem(name: "bandwidth", value: QueryValue(value).encoded))
            }
            if let value = bufferedTime {
                items.append(URLQueryItem(name: "bufferedTime", value: QueryValue(value).encoded))
            }
            if let value = bufferedSize {
                items.append(URLQueryItem(name: "bufferedSize", value: QueryValue(value).encoded))
            }
            if let value = containerKey {
                items.append(URLQueryItem(name: "containerKey", value: QueryValue(value).encoded))
            }
            if let value = guid {
                items.append(URLQueryItem(name: "guid", value: QueryValue(value).encoded))
            }
            if let value = playQueueID {
                items.append(URLQueryItem(name: "playQueueID", value: QueryValue(value).encoded))
            }
            if let value = url {
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            return items
        }

        public var headers: [String: String] {
            var headers: [String: String] = [:]
            if let value = xPlexSessionIdentifier {
                headers["X-Plex-Session-Identifier"] = QueryValue(value).encoded
            }
            return headers
        }
    }
}
