// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Create a custom hub based on a metadata item
    public struct CreateCustomHub: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "createCustomHub"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section ID for the hubs to reorder
        public var sectionId: Int

        /// The metadata item on which to base this hub. This must currently be a collection
        public var metadataItemId: Int

        /// Whether this hub should be displayed in recommended
        public var promotedToRecommended: BoolInt?

        /// Whether this hub should be displayed in admin's home
        public var promotedToOwnHome: BoolInt?

        /// Whether this hub should be displayed in shared user's home
        public var promotedToSharedHome: BoolInt?

        public init(
            sectionId: Int,
            metadataItemId: Int,
            promotedToRecommended: BoolInt? = nil,
            promotedToOwnHome: BoolInt? = nil,
            promotedToSharedHome: BoolInt? = nil
        ) {
            self.sectionId = sectionId
            self.metadataItemId = metadataItemId
            self.promotedToRecommended = promotedToRecommended
            self.promotedToOwnHome = promotedToOwnHome
            self.promotedToSharedHome = promotedToSharedHome
        }

        public var path: String { "/hubs/sections/\(PathComponent(sectionId))/manage" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = metadataItemId
                items.append(URLQueryItem(name: "metadataItemId", value: QueryValue(value).encoded))
            }
            if let value = promotedToRecommended {
                items.append(URLQueryItem(name: "promotedToRecommended", value: QueryValue(value).encoded))
            }
            if let value = promotedToOwnHome {
                items.append(URLQueryItem(name: "promotedToOwnHome", value: QueryValue(value).encoded))
            }
            if let value = promotedToSharedHome {
                items.append(URLQueryItem(name: "promotedToSharedHome", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
