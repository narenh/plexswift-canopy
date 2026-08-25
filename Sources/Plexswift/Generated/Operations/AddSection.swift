// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Add a new library section to the server
    public struct AddSection: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "addSection"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The name of the new section
        public var name: String

        /// The type of library section
        public var type: Int

        /// The scanner this section should use
        public var scanner: String?

        /// The agent this section should use for metadata
        public var agent: String

        /// The agent group id for this section
        public var metadataAgentProviderGroupId: String?

        /// The language of this section
        public var language: String

        /// The locations on disk to add to this section
        public var locations: [String]?

        /// The preferences for this section
        public var prefs: AnyJSON?

        /// If set, paths are relative to `Media Upload` path
        public var relative: BoolInt?

        /// If set, import media from iTunes.
        public var importFromiTunes: BoolInt?

        public init(
            name: String,
            type: Int,
            scanner: String? = nil,
            agent: String,
            metadataAgentProviderGroupId: String? = nil,
            language: String,
            locations: [String]? = nil,
            prefs: AnyJSON? = nil,
            relative: BoolInt? = nil,
            importFromiTunes: BoolInt? = nil
        ) {
            self.name = name
            self.type = type
            self.scanner = scanner
            self.agent = agent
            self.metadataAgentProviderGroupId = metadataAgentProviderGroupId
            self.language = language
            self.locations = locations
            self.prefs = prefs
            self.relative = relative
            self.importFromiTunes = importFromiTunes
        }

        public var path: String { "/library/sections/all" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = name
                items.append(URLQueryItem(name: "name", value: QueryValue(value).encoded))
            }
            do {
                let value = type
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            if let value = scanner {
                items.append(URLQueryItem(name: "scanner", value: QueryValue(value).encoded))
            }
            do {
                let value = agent
                items.append(URLQueryItem(name: "agent", value: QueryValue(value).encoded))
            }
            if let value = metadataAgentProviderGroupId {
                items.append(URLQueryItem(name: "metadataAgentProviderGroupId", value: QueryValue(value).encoded))
            }
            do {
                let value = language
                items.append(URLQueryItem(name: "language", value: QueryValue(value).encoded))
            }
            if let value = locations {
                for element in value {
                    items.append(URLQueryItem(name: "locations", value: QueryValue(element).encoded))
                }
            }
            if let value = prefs {
                items.append(URLQueryItem(name: "prefs", value: QueryValue(value).encoded))
            }
            if let value = relative {
                items.append(URLQueryItem(name: "relative", value: QueryValue(value).encoded))
            }
            if let value = importFromiTunes {
                items.append(URLQueryItem(name: "importFromiTunes", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
