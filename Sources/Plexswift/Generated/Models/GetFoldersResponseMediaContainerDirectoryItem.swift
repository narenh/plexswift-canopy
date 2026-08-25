// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetFoldersResponseMediaContainerDirectoryItem: Codable, Hashable, Sendable {
    public let title: String?

    public let fastKey: String?

    public let key: String?

    public init(
        title: String? = nil,
        fastKey: String? = nil,
        key: String? = nil
    ) {
        self.title = title
        self.fastKey = fastKey
        self.key = key
    }
}
