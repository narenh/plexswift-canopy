// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint will write multiple lines to the main Plex Media Server log in a single request.
    /// It takes a set of query strings as would normally sent to the above PUT endpoint as a
    /// linefeed-separated block of POST data. The parameters for each query string match as above.
    public struct WriteLog: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "writeLog"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        /// The request body.
        public var body: String

        public init(
            body: String
        ) {
            self.body = body
        }

        public var path: String { "/log" }

        public func body(encoder: JSONEncoder) throws -> RequestBody? {
            let value = self.body
            return RequestBody.text(value)
        }
    }
}
