// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Edit a library section by id setting parameters
    public struct EditSection: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "editSection"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section identifier
        public var sectionId: String

        /// The name of the new section
        public var name: String?

        /// The scanner this section should use
        public var scanner: String?

        /// The agent this section should use for metadata
        public var agent: String

        /// The agent group id for this section
        public var metadataAgentProviderGroupId: String?

        /// The language of this section
        public var language: String?

        /// The locations on disk to add to this section
        public var locations: [String]?

        /// The preferences for this section
        public var prefs: AnyJSON?

        public init(
            sectionId: String,
            name: String? = nil,
            scanner: String? = nil,
            agent: String,
            metadataAgentProviderGroupId: String? = nil,
            language: String? = nil,
            locations: [String]? = nil,
            prefs: AnyJSON? = nil
        ) {
            self.sectionId = sectionId
            self.name = name
            self.scanner = scanner
            self.agent = agent
            self.metadataAgentProviderGroupId = metadataAgentProviderGroupId
            self.language = language
            self.locations = locations
            self.prefs = prefs
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = name {
                items.append(URLQueryItem(name: "name", value: QueryValue(value).encoded))
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
            if let value = language {
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
            return items
        }
    }
}
