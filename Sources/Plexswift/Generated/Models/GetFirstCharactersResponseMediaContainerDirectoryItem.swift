// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetFirstCharactersResponseMediaContainerDirectoryItem: Codable, Hashable, Sendable {
    public let title: String?

    public let key: String?

    /// The number of items starting with this character
    public let size: Int?

    public init(
        title: String? = nil,
        key: String? = nil,
        size: Int? = nil
    ) {
        self.title = title
        self.key = key
        self.size = size
    }
}
