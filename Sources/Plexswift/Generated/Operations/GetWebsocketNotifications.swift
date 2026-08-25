// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// WebSocket endpoint for real-time notifications (plural alias). Connect with X-Plex-Token header.
    /// Delivers NotificationContainer messages.
    public struct GetWebsocketNotifications: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getWebsocketNotifications"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/:/websockets/notifications" }
    }
}
