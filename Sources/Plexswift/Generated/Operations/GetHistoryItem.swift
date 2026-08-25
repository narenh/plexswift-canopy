// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a single history item by id
    public struct GetHistoryItem: PlexOperation {
        public typealias Success = PlaybackHistoryMetadata

        public static let operationID = "getHistoryItem"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the history item (the `historyKey` from above)
        public var historyId: Int

        public init(
            historyId: Int
        ) {
            self.historyId = historyId
        }

        public var path: String { "/status/sessions/history/\(PathComponent(historyId))" }
    }
}
