// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List webhook URLs for the logged-in user.
    public struct GetUserWebhooks: PlexOperation {
        public typealias Success = WebhookPayload

        public static let operationID = "getUserWebhooks"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/api/v2/user/webhooks" }
    }
}
