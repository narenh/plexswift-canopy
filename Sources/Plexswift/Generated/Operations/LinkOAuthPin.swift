// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Link a PIN to an account (OAuth completion).
    public struct LinkOAuthPin: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "linkOAuthPin"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        /// The request body.
        public var body: LinkOAuthPinBody?

        public init(
            body: LinkOAuthPinBody? = nil
        ) {
            self.body = body
        }

        public var path: String { "/pins/link" }

        public func body(encoder: JSONEncoder) throws -> RequestBody? {
            guard let value = self.body else { return nil }
            return try .json(value, encoder: encoder)
        }
    }
}
