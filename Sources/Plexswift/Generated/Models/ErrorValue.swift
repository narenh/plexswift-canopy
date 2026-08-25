// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ErrorValue: Codable, Hashable, Sendable {
    public let errors: [ErrorValueErrorsItem]?

    public init(
        errors: [ErrorValueErrorsItem]? = nil
    ) {
        self.errors = errors
    }
}
