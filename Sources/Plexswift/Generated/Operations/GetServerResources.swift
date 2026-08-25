// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get Plex server access tokens and server connections
    public struct GetServerResources: PlexOperation {
        public typealias Success = [PlexDevice]

        public static let operationID = "getServerResources"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Include Https entries in the results
        public var includeHttps: GetServerResourcesIncludeHttps?

        /// Include Relay addresses in the results
        /// E.g: https://10-0-0-25.bbf8e10c7fa20447cacee74cd9914cde.plex.direct:32400
        public var includeRelay: GetServerResourcesIncludeRelay?

        /// Include IPv6 entries in the results
        public var includeIPv6: GetServerResourcesIncludeIPv6?

        public init(
            includeHttps: GetServerResourcesIncludeHttps? = nil,
            includeRelay: GetServerResourcesIncludeRelay? = nil,
            includeIPv6: GetServerResourcesIncludeIPv6? = nil
        ) {
            self.includeHttps = includeHttps
            self.includeRelay = includeRelay
            self.includeIPv6 = includeIPv6
        }

        public var path: String { "/resources" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = includeHttps {
                items.append(URLQueryItem(name: "includeHttps", value: QueryValue(value).encoded))
            }
            if let value = includeRelay {
                items.append(URLQueryItem(name: "includeRelay", value: QueryValue(value).encoded))
            }
            if let value = includeIPv6 {
                items.append(URLQueryItem(name: "includeIPv6", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
