// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a library section by id
    public struct DeleteLibrarySection: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteLibrarySection"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section identifier
        public var sectionId: String

        /// If set, response will return an activity with the actual deletion process. Otherwise request
        /// will return when deletion is complete
        public var `async`: BoolInt?

        public init(
            sectionId: String,
            async: BoolInt? = nil
        ) {
            self.sectionId = sectionId
            self.`async` = `async`
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = `async` {
                items.append(URLQueryItem(name: "async", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
