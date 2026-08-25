// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Error: Codable, Hashable, Sendable {
    public let errors: [ErrorErrorsItem]?

    public init(
        errors: [ErrorErrorsItem]? = nil
    ) {
        self.errors = errors
    }
}
