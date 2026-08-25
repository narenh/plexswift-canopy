// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List configured webhook URLs for the logged-in user.
    public struct GetWebhooks: PlexOperation {
        public typealias Success = WebhookPayload

        public static let operationID = "getWebhooks"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/webhooks" }
    }
}
