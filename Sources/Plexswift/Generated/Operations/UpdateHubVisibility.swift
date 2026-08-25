// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Changed the visibility of a hub for both the admin and shared users
    public struct UpdateHubVisibility: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "updateHubVisibility"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section ID for the hubs to change
        public var sectionId: Int

        /// The identifier of the hub to change
        public var identifier: String

        /// Whether this hub should be displayed in recommended
        public var promotedToRecommended: BoolInt?

        /// Whether this hub should be displayed in admin's home
        public var promotedToOwnHome: BoolInt?

        /// Whether this hub should be displayed in shared user's home
        public var promotedToSharedHome: BoolInt?

        public init(
            sectionId: Int,
            identifier: String,
            promotedToRecommended: BoolInt? = nil,
            promotedToOwnHome: BoolInt? = nil,
            promotedToSharedHome: BoolInt? = nil
        ) {
            self.sectionId = sectionId
            self.identifier = identifier
            self.promotedToRecommended = promotedToRecommended
            self.promotedToOwnHome = promotedToOwnHome
            self.promotedToSharedHome = promotedToSharedHome
        }

        public var path: String { "/hubs/sections/\(PathComponent(sectionId))/manage/\(PathComponent(identifier))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
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
