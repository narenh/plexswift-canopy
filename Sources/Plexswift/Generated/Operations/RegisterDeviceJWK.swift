// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Register a device public key (JWK) for JWT-based authentication.
    public struct RegisterDeviceJWK: PlexOperation {
        public typealias Success = AuthTokenResponse

        public static let operationID = "registerDeviceJWK"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.clientsPlexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The request body.
        public var body: JWKRegistrationRequest?

        public init(
            body: JWKRegistrationRequest? = nil
        ) {
            self.body = body
        }

        public var path: String { "/auth/jwk" }

        public func body(encoder: JSONEncoder) throws -> RequestBody? {
            guard let value = self.body else { return nil }
            return try .json(value, encoder: encoder)
        }
    }
}
