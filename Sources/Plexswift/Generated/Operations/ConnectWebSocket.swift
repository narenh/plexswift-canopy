// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Connect to the web socket to get a stream of events
    public struct ConnectWebSocket: PlexOperation {
        public typealias Success = Data

        public static let operationID = "connectWebSocket"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// By default, all events except logs are sent. A rich filtering mechanism is provided to allow
        /// clients to opt into or out of each event type using the `filters` parameter. For example:
        ///
        /// - `filters=-log`: All event types except logs (the default).
        /// - `filters=foo,bar`: Only the foo and bar event types.
        /// - `filters=`: All events types.
        /// - `filters=-foo,bar`: All event types except foo and bar.
        public var filter: [String]?

        public init(
            filter: [String]? = nil
        ) {
            self.filter = filter
        }

        public var path: String { "/:/websocket/notifications" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = filter {
                for element in value {
                    items.append(URLQueryItem(name: "filter", value: QueryValue(element).encoded))
                }
            }
            return items
        }
    }
}
