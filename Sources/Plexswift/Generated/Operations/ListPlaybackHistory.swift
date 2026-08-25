// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List all playback history (Admin can see all users, others can only see their own).
    /// Pagination should be used on this endpoint. Additionally this endpoint supports `includeFields`,
    /// `excludeFields`, `includeElements`, and `excludeElements` parameters.
    public struct ListPlaybackHistory: PlexOperation {
        public typealias Success = ListPlaybackHistoryResponse

        public static let operationID = "listPlaybackHistory"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Pagination start offset
        public var xPlexContainerStart: Int?

        /// Pagination page size
        public var xPlexContainerSize: Int?

        /// The account id to restrict view history
        public var accountID: Int?

        /// The time period to restrict history (typically of the form `viewedAt>=12456789`)
        public var viewedAt: Int?

        /// The library section id to restrict view history
        public var librarySectionID: Int?

        /// The metadata item to restrict view history (can provide the id for a show to see all of that
        /// show's view history). Note this is translated to `metadata_items.id`, `parents.id`, or
        /// `grandparents.id` internally depending on the metadata type.
        public var metadataItemID: Int?

        /// The field on which to sort. Multiple orderings can be specified separated by `,` and the
        /// direction specified following a `:` (`desc` or `asc`; `asc` is assumed if not provided). Note
        /// `metadataItemID` may not be used here.
        public var sort: [String]?

        /// Comma-separated list of elements to exclude from the response
        public var excludeElements: String?

        /// Comma-separated list of fields to exclude from the response
        public var excludeFields: String?

        /// Whitelist of fields to return
        public var includeFields: String?

        /// Whitelist of elements to include
        public var includeElements: String?

        /// Greater-than filter for viewedAt timestamp
        public var viewedAt2: Int?

        /// Less-than filter for viewedAt timestamp
        public var viewedAt3: Int?

        /// Filter by device ID
        public var deviceID: Int?

        public init(
            xPlexContainerStart: Int? = nil,
            xPlexContainerSize: Int? = nil,
            accountID: Int? = nil,
            viewedAt: Int? = nil,
            librarySectionID: Int? = nil,
            metadataItemID: Int? = nil,
            sort: [String]? = nil,
            excludeElements: String? = nil,
            excludeFields: String? = nil,
            includeFields: String? = nil,
            includeElements: String? = nil,
            viewedAt2: Int? = nil,
            viewedAt3: Int? = nil,
            deviceID: Int? = nil
        ) {
            self.xPlexContainerStart = xPlexContainerStart
            self.xPlexContainerSize = xPlexContainerSize
            self.accountID = accountID
            self.viewedAt = viewedAt
            self.librarySectionID = librarySectionID
            self.metadataItemID = metadataItemID
            self.sort = sort
            self.excludeElements = excludeElements
            self.excludeFields = excludeFields
            self.includeFields = includeFields
            self.includeElements = includeElements
            self.viewedAt2 = viewedAt2
            self.viewedAt3 = viewedAt3
            self.deviceID = deviceID
        }

        public var path: String { "/status/sessions/history/all" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = xPlexContainerStart {
                items.append(URLQueryItem(name: "X-Plex-Container-Start", value: QueryValue(value).encoded))
            }
            if let value = xPlexContainerSize {
                items.append(URLQueryItem(name: "X-Plex-Container-Size", value: QueryValue(value).encoded))
            }
            if let value = accountID {
                items.append(URLQueryItem(name: "accountID", value: QueryValue(value).encoded))
            }
            if let value = viewedAt {
                items.append(URLQueryItem(name: "viewedAt", value: QueryValue(value).encoded))
            }
            if let value = librarySectionID {
                items.append(URLQueryItem(name: "librarySectionID", value: QueryValue(value).encoded))
            }
            if let value = metadataItemID {
                items.append(URLQueryItem(name: "metadataItemID", value: QueryValue(value).encoded))
            }
            if let value = sort {
                for element in value {
                    items.append(URLQueryItem(name: "sort", value: QueryValue(element).encoded))
                }
            }
            if let value = excludeElements {
                items.append(URLQueryItem(name: "excludeElements", value: QueryValue(value).encoded))
            }
            if let value = excludeFields {
                items.append(URLQueryItem(name: "excludeFields", value: QueryValue(value).encoded))
            }
            if let value = includeFields {
                items.append(URLQueryItem(name: "includeFields", value: QueryValue(value).encoded))
            }
            if let value = includeElements {
                items.append(URLQueryItem(name: "includeElements", value: QueryValue(value).encoded))
            }
            if let value = viewedAt2 {
                items.append(URLQueryItem(name: "viewedAt>", value: QueryValue(value).encoded))
            }
            if let value = viewedAt3 {
                items.append(URLQueryItem(name: "viewedAt<", value: QueryValue(value).encoded))
            }
            if let value = deviceID {
                items.append(URLQueryItem(name: "deviceID", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
