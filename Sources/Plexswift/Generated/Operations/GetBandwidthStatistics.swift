// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get dashboard bandwidth data.
    public struct GetBandwidthStatistics: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "getBandwidthStatistics"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Dashboard timespan (1-6)
        public var timespan: Int?

        /// Filter by account ID
        public var accountID: Int?

        /// Filter by device ID
        public var deviceID: Int?

        /// Filter to LAN-only traffic
        public var lan: BoolInt?

        public init(
            timespan: Int? = nil,
            accountID: Int? = nil,
            deviceID: Int? = nil,
            lan: BoolInt? = nil
        ) {
            self.timespan = timespan
            self.accountID = accountID
            self.deviceID = deviceID
            self.lan = lan
        }

        public var path: String { "/statistics/bandwidth" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = timespan {
                items.append(URLQueryItem(name: "timespan", value: QueryValue(value).encoded))
            }
            if let value = accountID {
                items.append(URLQueryItem(name: "accountID", value: QueryValue(value).encoded))
            }
            if let value = deviceID {
                items.append(URLQueryItem(name: "deviceID", value: QueryValue(value).encoded))
            }
            if let value = lan {
                items.append(URLQueryItem(name: "lan", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
