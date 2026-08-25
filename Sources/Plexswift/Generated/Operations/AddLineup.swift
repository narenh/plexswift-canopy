// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Add a lineup to a DVR device's set of lineups.
    public struct AddLineup: PlexOperation {
        public typealias Success = DVRResponse

        public static let operationID = "addLineup"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the DVR.
        public var dvrId: Int

        /// The lineup to delete
        public var lineup: String

        public init(
            dvrId: Int,
            lineup: String
        ) {
            self.dvrId = dvrId
            self.lineup = lineup
        }

        public var path: String { "/livetv/dvrs/\(PathComponent(dvrId))/lineups" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = lineup
                items.append(URLQueryItem(name: "lineup", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
