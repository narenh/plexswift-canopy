// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of all available DVRs
    public struct ListDVRs: PlexOperation {
        public typealias Success = DVRResponse

        public static let operationID = "listDVRs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        /// Filter by DVR UUID.
        public var uuid: String?

        /// Filter by lineup.
        public var lineup: String?

        public init(
            uuid: String? = nil,
            lineup: String? = nil
        ) {
            self.uuid = uuid
            self.lineup = lineup
        }

        public var path: String { "/livetv/dvrs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = uuid {
                items.append(URLQueryItem(name: "uuid", value: QueryValue(value).encoded))
            }
            if let value = lineup {
                items.append(URLQueryItem(name: "lineup", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
