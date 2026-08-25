// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct EPGLanguage: Codable, Hashable, Sendable {
    public let title: String?

    /// 3 letter language code
    public let code: String?

    public init(
        title: String? = nil,
        code: String? = nil
    ) {
        self.title = title
        self.code = code
    }
}
