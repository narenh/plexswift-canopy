// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The user playing the content
public struct User: Codable, Hashable, Sendable {
    /// The username
    public let title: String?

    /// The id of the user
    public let id: String?

    /// Thumb image to display for the user
    public let thumb: String?

    public init(
        title: String? = nil,
        id: String? = nil,
        thumb: String? = nil
    ) {
        self.title = title
        self.id = id
        self.thumb = thumb
    }
}
