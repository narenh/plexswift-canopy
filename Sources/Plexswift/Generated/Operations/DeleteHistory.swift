// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a single history item by id
    public struct DeleteHistory: PlexOperation {
        public typealias Success = MediaContainer

        public static let operationID = "deleteHistory"
        public static let method = HTTPMethod.delete
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
