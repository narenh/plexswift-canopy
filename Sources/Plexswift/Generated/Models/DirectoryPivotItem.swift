// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct DirectoryPivotItem: Codable, Hashable, Sendable {
    public let title: String?

    public let type: String?

    public let context: String?

    public let id: String?

    public let key: String?

    public let symbol: String?

    public init(
        title: String? = nil,
        type: String? = nil,
        context: String? = nil,
        id: String? = nil,
        key: String? = nil,
        symbol: String? = nil
    ) {
        self.title = title
        self.type = type
        self.context = context
        self.id = id
        self.key = key
        self.symbol = symbol
    }
}
