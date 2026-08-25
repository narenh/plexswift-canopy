// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Returns details for the library. This can be thought of as an interstitial endpoint because it
    /// contains information about the library, rather than content itself. It often contains a list of
    /// `Directory` metadata objects: These used to be used by clients to build a menuing system.
    public struct GetLibraryDetails: PlexOperation {
        public typealias Success = GetLibraryDetailsResponse

        public static let operationID = "getLibraryDetails"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section identifier
        public var sectionId: String

        /// Whether or not to include details for a section (types, filters, and sorts). Only exists for
        /// backwards compatibility, media providers other than the server libraries have it on always.
        public var includeDetails: BoolInt?

        public init(
            sectionId: String,
            includeDetails: BoolInt? = nil
        ) {
            self.sectionId = sectionId
            self.includeDetails = includeDetails
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = includeDetails {
                items.append(URLQueryItem(name: "includeDetails", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
