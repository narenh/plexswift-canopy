// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the items in a section, potentially filtering them.
    /// When `includeCollections=1` is passed, the response may also contain `Collection` items.
    public struct ListContent: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "listContent"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The index of the first item to return. If not specified, the first item will be returned.
        /// If the number of items exceeds the limit, the response will be paginated.
        /// By default this is 0
        public var xPlexContainerStart: Int?

        /// The number of items to return. If not specified, all items will be returned.
        /// If the number of items exceeds the limit, the response will be paginated.
        /// By default this is 50
        public var xPlexContainerSize: Int?

        /// A querystring-based filtering language used to select subsets of media. Can be provided as an
        /// object with typed properties for type safety, or as a string for complex queries with operators
        /// and boolean logic.
        ///
        /// The query supports:
        /// - Fields: integer, boolean, tag, string, date, language
        /// - Operators: =, !=, ==, !==, <=, >=, >>=, <<= (varies by field type)
        /// - Boolean operators: & (AND), , (OR), push/pop (parentheses), or=1 (explicit OR)
        /// - Sorting: sort parameter with :desc, :nullsLast modifiers
        /// - Grouping: group parameter
        /// - Limits: limit parameter
        ///
        /// Examples:
        /// - Object format: `{type: 4, sourceType: 2, title: "24"}` → `type=4&sourceType=2&title=24`
        /// - String format: `type=4&sourceType=2&title==24` - type = 4 AND sourceType = 2 AND title = "24"
        /// - Complex: `push=1&index=1&or=1&rating=2&pop=1&duration=10` - (index = 1 OR rating = 2) AND duration = 10
        ///
        /// See [API Info section](#section/API-Info/Media-Queries) for detailed information on building
        /// media queries.
        public var mediaQuery: MediaQuery?

        /// The id of the section
        public var sectionId: Int

        /// Adds the Meta object to the response
        public var includeMeta: BoolInt?

        /// Adds the Guid object to the response
        public var includeGuids: BoolInt?

        /// Include collection items in results
        public var includeCollections: BoolInt?

        /// Include external or online media
        public var includeExternalMedia: BoolInt?

        /// Include advanced settings
        public var includeAdvanced: BoolInt?

        /// Verify file existence
        public var checkFiles: BoolInt?

        /// Include related items
        public var includeRelated: BoolInt?

        /// Include trailers, behind-the-scenes, etc.
        public var includeExtras: BoolInt?

        /// Include popular episodes
        public var includePopularLeaves: BoolInt?

        /// Include concert items
        public var includeConcerts: BoolInt?

        /// Include On Deck status
        public var includeOnDeck: BoolInt?

        /// Include chapter markers
        public var includeChapters: BoolInt?

        /// Include user preferences
        public var includePreferences: BoolInt?

        /// Include bandwidth info
        public var includeBandwidths: BoolInt?

        /// Include loudness ramp data
        public var includeLoudnessRamps: BoolInt?

        /// Include radio station data
        public var includeStations: BoolInt?

        /// Include external GUIDs
        public var includeExternalIds: BoolInt?

        /// Include user reviews
        public var includeReviews: BoolInt?

        /// Include full credits
        public var includeCredits: BoolInt?

        /// Force inclusion of artwork fields
        public var includeArt: BoolInt?

        /// Force inclusion of thumbnail fields
        public var includeThumb: BoolInt?

        /// Force inclusion of banner fields
        public var includeBanner: BoolInt?

        /// Force inclusion of theme fields
        public var includeTheme: BoolInt?

        /// Whitelist of fields to return
        public var includeFields: String?

        /// Blacklist of fields to omit
        public var excludeFields: String?

        /// Async metadata augmentation
        public var asyncAugmentMetadata: BoolInt?

        /// Async local media agent refresh
        public var asyncRefreshLocalMediaAgent: BoolInt?

        /// Bypass cache
        public var nocache: BoolInt?

        /// Skip synchronous refresh
        public var skipRefresh: BoolInt?

        /// Comma-separated list of elements to exclude from the response
        public var excludeElements: String?

        /// General filtering expression.
        public var filters: String?

        /// Filter to unwatched only (1 = true).
        public var unwatched: BoolInt?

        /// Filter by genre.
        public var genre: String?

        /// Filter by studio.
        public var studio: String?

        /// Filter by content rating.
        public var contentRating: String?

        /// Filter by resolution.
        public var resolution: String?

        /// Filter by year.
        public var year: Int?

        /// Filter by first character of title.
        public var firstCharacter: String?

        public init(
            xPlexContainerStart: Int? = nil,
            xPlexContainerSize: Int? = nil,
            mediaQuery: MediaQuery? = nil,
            sectionId: Int,
            includeMeta: BoolInt? = nil,
            includeGuids: BoolInt? = nil,
            includeCollections: BoolInt? = nil,
            includeExternalMedia: BoolInt? = nil,
            includeAdvanced: BoolInt? = nil,
            checkFiles: BoolInt? = nil,
            includeRelated: BoolInt? = nil,
            includeExtras: BoolInt? = nil,
            includePopularLeaves: BoolInt? = nil,
            includeConcerts: BoolInt? = nil,
            includeOnDeck: BoolInt? = nil,
            includeChapters: BoolInt? = nil,
            includePreferences: BoolInt? = nil,
            includeBandwidths: BoolInt? = nil,
            includeLoudnessRamps: BoolInt? = nil,
            includeStations: BoolInt? = nil,
            includeExternalIds: BoolInt? = nil,
            includeReviews: BoolInt? = nil,
            includeCredits: BoolInt? = nil,
            includeArt: BoolInt? = nil,
            includeThumb: BoolInt? = nil,
            includeBanner: BoolInt? = nil,
            includeTheme: BoolInt? = nil,
            includeFields: String? = nil,
            excludeFields: String? = nil,
            asyncAugmentMetadata: BoolInt? = nil,
            asyncRefreshLocalMediaAgent: BoolInt? = nil,
            nocache: BoolInt? = nil,
            skipRefresh: BoolInt? = nil,
            excludeElements: String? = nil,
            filters: String? = nil,
            unwatched: BoolInt? = nil,
            genre: String? = nil,
            studio: String? = nil,
            contentRating: String? = nil,
            resolution: String? = nil,
            year: Int? = nil,
            firstCharacter: String? = nil
        ) {
            self.xPlexContainerStart = xPlexContainerStart
            self.xPlexContainerSize = xPlexContainerSize
            self.mediaQuery = mediaQuery
            self.sectionId = sectionId
            self.includeMeta = includeMeta
            self.includeGuids = includeGuids
            self.includeCollections = includeCollections
            self.includeExternalMedia = includeExternalMedia
            self.includeAdvanced = includeAdvanced
            self.checkFiles = checkFiles
            self.includeRelated = includeRelated
            self.includeExtras = includeExtras
            self.includePopularLeaves = includePopularLeaves
            self.includeConcerts = includeConcerts
            self.includeOnDeck = includeOnDeck
            self.includeChapters = includeChapters
            self.includePreferences = includePreferences
            self.includeBandwidths = includeBandwidths
            self.includeLoudnessRamps = includeLoudnessRamps
            self.includeStations = includeStations
            self.includeExternalIds = includeExternalIds
            self.includeReviews = includeReviews
            self.includeCredits = includeCredits
            self.includeArt = includeArt
            self.includeThumb = includeThumb
            self.includeBanner = includeBanner
            self.includeTheme = includeTheme
            self.includeFields = includeFields
            self.excludeFields = excludeFields
            self.asyncAugmentMetadata = asyncAugmentMetadata
            self.asyncRefreshLocalMediaAgent = asyncRefreshLocalMediaAgent
            self.nocache = nocache
            self.skipRefresh = skipRefresh
            self.excludeElements = excludeElements
            self.filters = filters
            self.unwatched = unwatched
            self.genre = genre
            self.studio = studio
            self.contentRating = contentRating
            self.resolution = resolution
            self.year = year
            self.firstCharacter = firstCharacter
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/all" }

        public var queryItems: [URLQueryItem] { get throws {
            var items: [URLQueryItem] = []
            if let value = xPlexContainerStart {
                items.append(URLQueryItem(name: "X-Plex-Container-Start", value: QueryValue(value).encoded))
            }
            if let value = xPlexContainerSize {
                items.append(URLQueryItem(name: "X-Plex-Container-Size", value: QueryValue(value).encoded))
            }
            if let value = mediaQuery {
                items.append(contentsOf: try DeepObjectQuery.items(name: "mediaQuery", value: value))
            }
            if let value = includeMeta {
                items.append(URLQueryItem(name: "includeMeta", value: QueryValue(value).encoded))
            }
            if let value = includeGuids {
                items.append(URLQueryItem(name: "includeGuids", value: QueryValue(value).encoded))
            }
            if let value = includeCollections {
                items.append(URLQueryItem(name: "includeCollections", value: QueryValue(value).encoded))
            }
            if let value = includeExternalMedia {
                items.append(URLQueryItem(name: "includeExternalMedia", value: QueryValue(value).encoded))
            }
            if let value = includeAdvanced {
                items.append(URLQueryItem(name: "includeAdvanced", value: QueryValue(value).encoded))
            }
            if let value = checkFiles {
                items.append(URLQueryItem(name: "checkFiles", value: QueryValue(value).encoded))
            }
            if let value = includeRelated {
                items.append(URLQueryItem(name: "includeRelated", value: QueryValue(value).encoded))
            }
            if let value = includeExtras {
                items.append(URLQueryItem(name: "includeExtras", value: QueryValue(value).encoded))
            }
            if let value = includePopularLeaves {
                items.append(URLQueryItem(name: "includePopularLeaves", value: QueryValue(value).encoded))
            }
            if let value = includeConcerts {
                items.append(URLQueryItem(name: "includeConcerts", value: QueryValue(value).encoded))
            }
            if let value = includeOnDeck {
                items.append(URLQueryItem(name: "includeOnDeck", value: QueryValue(value).encoded))
            }
            if let value = includeChapters {
                items.append(URLQueryItem(name: "includeChapters", value: QueryValue(value).encoded))
            }
            if let value = includePreferences {
                items.append(URLQueryItem(name: "includePreferences", value: QueryValue(value).encoded))
            }
            if let value = includeBandwidths {
                items.append(URLQueryItem(name: "includeBandwidths", value: QueryValue(value).encoded))
            }
            if let value = includeLoudnessRamps {
                items.append(URLQueryItem(name: "includeLoudnessRamps", value: QueryValue(value).encoded))
            }
            if let value = includeStations {
                items.append(URLQueryItem(name: "includeStations", value: QueryValue(value).encoded))
            }
            if let value = includeExternalIds {
                items.append(URLQueryItem(name: "includeExternalIds", value: QueryValue(value).encoded))
            }
            if let value = includeReviews {
                items.append(URLQueryItem(name: "includeReviews", value: QueryValue(value).encoded))
            }
            if let value = includeCredits {
                items.append(URLQueryItem(name: "includeCredits", value: QueryValue(value).encoded))
            }
            if let value = includeArt {
                items.append(URLQueryItem(name: "includeArt", value: QueryValue(value).encoded))
            }
            if let value = includeThumb {
                items.append(URLQueryItem(name: "includeThumb", value: QueryValue(value).encoded))
            }
            if let value = includeBanner {
                items.append(URLQueryItem(name: "includeBanner", value: QueryValue(value).encoded))
            }
            if let value = includeTheme {
                items.append(URLQueryItem(name: "includeTheme", value: QueryValue(value).encoded))
            }
            if let value = includeFields {
                items.append(URLQueryItem(name: "includeFields", value: QueryValue(value).encoded))
            }
            if let value = excludeFields {
                items.append(URLQueryItem(name: "excludeFields", value: QueryValue(value).encoded))
            }
            if let value = asyncAugmentMetadata {
                items.append(URLQueryItem(name: "asyncAugmentMetadata", value: QueryValue(value).encoded))
            }
            if let value = asyncRefreshLocalMediaAgent {
                items.append(URLQueryItem(name: "asyncRefreshLocalMediaAgent", value: QueryValue(value).encoded))
            }
            if let value = nocache {
                items.append(URLQueryItem(name: "nocache", value: QueryValue(value).encoded))
            }
            if let value = skipRefresh {
                items.append(URLQueryItem(name: "skipRefresh", value: QueryValue(value).encoded))
            }
            if let value = excludeElements {
                items.append(URLQueryItem(name: "excludeElements", value: QueryValue(value).encoded))
            }
            if let value = filters {
                items.append(URLQueryItem(name: "filters", value: QueryValue(value).encoded))
            }
            if let value = unwatched {
                items.append(URLQueryItem(name: "unwatched", value: QueryValue(value).encoded))
            }
            if let value = genre {
                items.append(URLQueryItem(name: "genre", value: QueryValue(value).encoded))
            }
            if let value = studio {
                items.append(URLQueryItem(name: "studio", value: QueryValue(value).encoded))
            }
            if let value = contentRating {
                items.append(URLQueryItem(name: "contentRating", value: QueryValue(value).encoded))
            }
            if let value = resolution {
                items.append(URLQueryItem(name: "resolution", value: QueryValue(value).encoded))
            }
            if let value = year {
                items.append(URLQueryItem(name: "year", value: QueryValue(value).encoded))
            }
            if let value = firstCharacter {
                items.append(URLQueryItem(name: "firstCharacter", value: QueryValue(value).encoded))
            }
            return items
        } }
    }
}
