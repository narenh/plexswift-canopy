// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the templates for a piece of media which could include fetching one airing, season, the
    /// whole show, etc.
    public struct GetTemplate: PlexOperation {
        public typealias Success = GetTemplateResponse

        public static let operationID = "getTemplate"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The guid of the item for which to get the template
        public var guid: String?

        /// Subscription type.
        public var type: String?

        /// Target library section ID.
        public var targetLibrarySectionID: Int?

        public init(
            guid: String? = nil,
            type: String? = nil,
            targetLibrarySectionID: Int? = nil
        ) {
            self.guid = guid
            self.type = type
            self.targetLibrarySectionID = targetLibrarySectionID
        }

        public var path: String { "/media/subscriptions/template" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = guid {
                items.append(URLQueryItem(name: "guid", value: QueryValue(value).encoded))
            }
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            if let value = targetLibrarySectionID {
                items.append(URLQueryItem(name: "targetLibrarySectionID", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
