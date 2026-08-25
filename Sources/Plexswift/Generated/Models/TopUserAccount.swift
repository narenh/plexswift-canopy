// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct TopUserAccount: Codable, Hashable, Sendable {
    public let globalViewCount: Int?

    public let id: Int?

    public init(
        globalViewCount: Int? = nil,
        id: Int? = nil
    ) {
        self.globalViewCount = globalViewCount
        self.id = id
    }
}
