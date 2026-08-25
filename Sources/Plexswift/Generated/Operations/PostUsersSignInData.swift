// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Sign in user with username and password and return user data with Plex authentication token
    public struct PostUsersSignInData: PlexOperation {
        public typealias Success = PostUsersSignInDataResponse

        public static let operationID = "postUsersSignInData"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = false
        public static let requiresClientIdentifier = true

        /// The request body.
        public var body: PostUsersSignInDataBody?

        public init(
            body: PostUsersSignInDataBody? = nil
        ) {
            self.body = body
        }

        public var path: String { "/users/signin" }

        public func body(encoder: JSONEncoder) throws -> RequestBody? {
            guard let value = self.body else { return nil }
            return try .json(value, encoder: encoder)
        }
    }
}
