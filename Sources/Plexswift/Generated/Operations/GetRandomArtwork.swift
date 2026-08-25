// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get random artwork across sections. This is commonly used for a screensaver.
    ///
    /// This retrieves 100 random artwork paths in the specified sections and returns them. Restrictions
    /// are put in place to not return artwork for items the user is not allowed to access. Artwork will
    /// be for Movies, Shows, and Artists only.
    public struct GetRandomArtwork: PlexOperation {
        public typealias Success = MediaContainerWithArtwork

        public static let operationID = "getRandomArtwork"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The sections for which to fetch artwork.
        public var sections: [Int]?

        public init(
            sections: [Int]? = nil
        ) {
            self.sections = sections
        }

        public var path: String { "/library/randomArtwork" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = sections {
                items.append(URLQueryItem(name: "sections", value: value.map { QueryValue($0).encoded }.joined(separator: ",")))
            }
            return items
        }
    }
}
