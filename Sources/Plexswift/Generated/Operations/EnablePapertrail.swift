// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint will enable all Plex Media Server logs to be sent to the Papertrail networked
    /// logging site for a period of time
    ///
    /// Note: This endpoint responds to all HTTP verbs but POST is preferred
    public struct EnablePapertrail: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "enablePapertrail"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The number of minutes logging should be sent to Papertrail
        public var minutes: Int?

        public init(
            minutes: Int? = nil
        ) {
            self.minutes = minutes
        }

        public var path: String { "/log/networked" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = minutes {
                items.append(URLQueryItem(name: "minutes", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
