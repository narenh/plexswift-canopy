// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// A library section (commonly referred to as just a library) is a collection of media. Libraries
    /// are typed, and depending on their type provide either a flat or a hierarchical view of the
    /// media. For example, a music library has an artist > albums > tracks structure, whereas a movie
    /// library is flat.
    /// Libraries have features beyond just being a collection of media; for starters, they include
    /// information about supported types, filters and sorts. This allows a client to provide a rich
    /// interface around the media (e.g. allow sorting movies by release year).
    public struct GetSections: PlexOperation {
        public typealias Success = GetSectionsResponse

        public static let operationID = "getSections"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/library/sections/all" }
    }
}
