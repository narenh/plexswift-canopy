// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the prefs for a section by id
    public struct SetSectionPreferences: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "setSectionPreferences"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Section identifier
        public var sectionId: Int

        /// The preference key to retrieve or set
        public var prefs: AnyJSON

        public init(
            sectionId: Int,
            prefs: AnyJSON
        ) {
            self.sectionId = sectionId
            self.prefs = prefs
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/prefs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = prefs
                items.append(URLQueryItem(name: "prefs", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
