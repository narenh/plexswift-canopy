// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint will write a single-line log message, including a level and source to the main
    /// Plex Media Server log.
    ///
    /// Note: This endpoint responds to all HTTP verbs **except POST** but PUT is preferred
    public struct WriteMessage: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "writeMessage"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// An integer log level to write to the PMS log with.
        /// - 0: Error
        /// - 1: Warning
        /// - 2: Info
        /// - 3: Debug
        /// - 4: Verbose
        public var level: WriteMessageLevel?

        /// The text of the message to write to the log.
        public var message: String?

        /// A string indicating the source of the message.
        public var source: String?

        public init(
            level: WriteMessageLevel? = nil,
            message: String? = nil,
            source: String? = nil
        ) {
            self.level = level
            self.message = message
            self.source = source
        }

        public var path: String { "/log" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = level {
                items.append(URLQueryItem(name: "level", value: QueryValue(value).encoded))
            }
            if let value = message {
                items.append(URLQueryItem(name: "message", value: QueryValue(value).encoded))
            }
            if let value = source {
                items.append(URLQueryItem(name: "source", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
