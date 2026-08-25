// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Represents a top-level location on disk where media in this library section is stored
public struct LibrarySectionLocationItem: Codable, Hashable, Sendable {
    public let id: Int?

    /// The path of where this directory exists on disk
    public let path: AnyJSON?

    public init(
        id: Int? = nil,
        path: AnyJSON? = nil
    ) {
        self.id = id
        self.path = path
    }
}
