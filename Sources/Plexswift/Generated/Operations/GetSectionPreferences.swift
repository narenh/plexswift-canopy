// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the prefs for a section by id and potentially overriding the agent
    public struct GetSectionPreferences: PlexOperation {
        public typealias Success = MediaContainerWithSettings

        public static let operationID = "getSectionPreferences"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Section identifier
        public var sectionId: Int

        /// The identifier of the metadata agent to use
        public var agent: String?

        public init(
            sectionId: Int,
            agent: String? = nil
        ) {
            self.sectionId = sectionId
            self.agent = agent
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/prefs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = agent {
                items.append(URLQueryItem(name: "agent", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
