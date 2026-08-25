// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Add a webhook URL for the logged-in user.
    public struct AddWebhook: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "addWebhook"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/webhooks" }
    }
}
