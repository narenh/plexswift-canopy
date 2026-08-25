// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// If a caller requires connection details and a transient token for a source that is known to the
    /// server, for example a cloud media provider or shared PMS, then this endpoint can be called. This
    /// endpoint is only accessible with either an admin token or a valid transient token generated from
    /// an admin token.
    public struct GetSourceConnectionInformation: PlexOperation {
        public typealias Success = GetSourceConnectionInformationResponse

        public static let operationID = "getSourceConnectionInformation"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The source identifier with an included prefix.
        public var source: String

        /// Force refresh
        public var refresh: BoolInt?

        public init(
            source: String,
            refresh: BoolInt? = nil
        ) {
            self.source = source
            self.refresh = refresh
        }

        public var path: String { "/security/resources" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = source
                items.append(URLQueryItem(name: "source", value: QueryValue(value).encoded))
            }
            if let value = refresh {
                items.append(URLQueryItem(name: "refresh", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
