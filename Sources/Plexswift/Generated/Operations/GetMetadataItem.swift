// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get one or more metadata items.
    public struct GetMetadataItem: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getMetadataItem"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: [String]

        /// Determines if file check should be performed asynchronously. An activity is created to indicate
        /// progress. Default is false.
        public var asyncCheckFiles: BoolInt?

        /// Determines if local media agent refresh should be performed asynchronously. An activity is
        /// created to indicate progress. Default is false.
        public var asyncRefreshLocalMediaAgent: BoolInt?

        /// Determines if analysis refresh should be performed asynchronously. An activity is created to
        /// indicate progress. Default is false.
        public var asyncRefreshAnalysis: BoolInt?

        /// Determines if file check should be performed synchronously. Specifying `asyncCheckFiles` will
        /// cause this option to be ignored. Default is false.
        public var checkFiles: BoolInt?

        /// Determines if synchronous local media agent and analysis refresh should be skipped. Specifying
        /// async versions will cause synchronous versions to be skipped. Default is false.
        public var skipRefresh: BoolInt?

        /// Determines if file existence check should be performed synchronously. Specifying `checkFiles`
        /// will imply this option. Default is false.
        public var checkFileAvailability: BoolInt?

        /// Add metadata augmentations. An activity is created to indicate progress. Option will be ignored
        /// if specified by non-admin or if multiple metadata items are requested. Default is false.
        public var asyncAugmentMetadata: BoolInt?

        /// Number of augmentations to add. Requires `asyncAugmentMetadata` to be specified.
        public var augmentCount: BoolInt?

        /// Include intro/credits markers in the response
        public var includeMarkers: Bool?

        /// Include external GUIDs (e.g. TMDB, TVDB) in the response
        public var includeGuids: Bool?

        /// Include chapter data in the response
        public var includeChapters: Bool?

        /// Include external/online media in the response
        public var includeExternalMedia: Bool?

        /// Include trailers, behind-the-scenes, and other extras
        public var includeExtras: Bool?

        /// Include related items in the response
        public var includeRelated: Bool?

        /// Include On Deck status in the response
        public var includeOnDeck: Bool?

        /// Include popular episodes in the response
        public var includePopularLeaves: Bool?

        /// Include user reviews in the response
        public var includeReviews: Bool?

        /// Include radio station data in the response
        public var includeStations: Bool?

        /// Comma-separated list of elements to exclude from the response
        public var excludeElements: String?

        /// Comma-separated list of fields to exclude from the response
        public var excludeFields: String?

        public init(
            ids: [String],
            asyncCheckFiles: BoolInt? = nil,
            asyncRefreshLocalMediaAgent: BoolInt? = nil,
            asyncRefreshAnalysis: BoolInt? = nil,
            checkFiles: BoolInt? = nil,
            skipRefresh: BoolInt? = nil,
            checkFileAvailability: BoolInt? = nil,
            asyncAugmentMetadata: BoolInt? = nil,
            augmentCount: BoolInt? = nil,
            includeMarkers: Bool? = nil,
            includeGuids: Bool? = nil,
            includeChapters: Bool? = nil,
            includeExternalMedia: Bool? = nil,
            includeExtras: Bool? = nil,
            includeRelated: Bool? = nil,
            includeOnDeck: Bool? = nil,
            includePopularLeaves: Bool? = nil,
            includeReviews: Bool? = nil,
            includeStations: Bool? = nil,
            excludeElements: String? = nil,
            excludeFields: String? = nil
        ) {
            self.ids = ids
            self.asyncCheckFiles = asyncCheckFiles
            self.asyncRefreshLocalMediaAgent = asyncRefreshLocalMediaAgent
            self.asyncRefreshAnalysis = asyncRefreshAnalysis
            self.checkFiles = checkFiles
            self.skipRefresh = skipRefresh
            self.checkFileAvailability = checkFileAvailability
            self.asyncAugmentMetadata = asyncAugmentMetadata
            self.augmentCount = augmentCount
            self.includeMarkers = includeMarkers
            self.includeGuids = includeGuids
            self.includeChapters = includeChapters
            self.includeExternalMedia = includeExternalMedia
            self.includeExtras = includeExtras
            self.includeRelated = includeRelated
            self.includeOnDeck = includeOnDeck
            self.includePopularLeaves = includePopularLeaves
            self.includeReviews = includeReviews
            self.includeStations = includeStations
            self.excludeElements = excludeElements
            self.excludeFields = excludeFields
        }

        public var path: String { "/library/metadata/\(ids.map { PathComponent($0).description }.joined(separator: ","))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = asyncCheckFiles {
                items.append(URLQueryItem(name: "asyncCheckFiles", value: QueryValue(value).encoded))
            }
            if let value = asyncRefreshLocalMediaAgent {
                items.append(URLQueryItem(name: "asyncRefreshLocalMediaAgent", value: QueryValue(value).encoded))
            }
            if let value = asyncRefreshAnalysis {
                items.append(URLQueryItem(name: "asyncRefreshAnalysis", value: QueryValue(value).encoded))
            }
            if let value = checkFiles {
                items.append(URLQueryItem(name: "checkFiles", value: QueryValue(value).encoded))
            }
            if let value = skipRefresh {
                items.append(URLQueryItem(name: "skipRefresh", value: QueryValue(value).encoded))
            }
            if let value = checkFileAvailability {
                items.append(URLQueryItem(name: "checkFileAvailability", value: QueryValue(value).encoded))
            }
            if let value = asyncAugmentMetadata {
                items.append(URLQueryItem(name: "asyncAugmentMetadata", value: QueryValue(value).encoded))
            }
            if let value = augmentCount {
                items.append(URLQueryItem(name: "augmentCount", value: QueryValue(value).encoded))
            }
            if let value = includeMarkers {
                items.append(URLQueryItem(name: "includeMarkers", value: QueryValue(value).encoded))
            }
            if let value = includeGuids {
                items.append(URLQueryItem(name: "includeGuids", value: QueryValue(value).encoded))
            }
            if let value = includeChapters {
                items.append(URLQueryItem(name: "includeChapters", value: QueryValue(value).encoded))
            }
            if let value = includeExternalMedia {
                items.append(URLQueryItem(name: "includeExternalMedia", value: QueryValue(value).encoded))
            }
            if let value = includeExtras {
                items.append(URLQueryItem(name: "includeExtras", value: QueryValue(value).encoded))
            }
            if let value = includeRelated {
                items.append(URLQueryItem(name: "includeRelated", value: QueryValue(value).encoded))
            }
            if let value = includeOnDeck {
                items.append(URLQueryItem(name: "includeOnDeck", value: QueryValue(value).encoded))
            }
            if let value = includePopularLeaves {
                items.append(URLQueryItem(name: "includePopularLeaves", value: QueryValue(value).encoded))
            }
            if let value = includeReviews {
                items.append(URLQueryItem(name: "includeReviews", value: QueryValue(value).encoded))
            }
            if let value = includeStations {
                items.append(URLQueryItem(name: "includeStations", value: QueryValue(value).encoded))
            }
            if let value = excludeElements {
                items.append(URLQueryItem(name: "excludeElements", value: QueryValue(value).encoded))
            }
            if let value = excludeFields {
                items.append(URLQueryItem(name: "excludeFields", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
