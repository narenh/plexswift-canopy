// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct UnauthorizedErrorResponse: Codable, Hashable, Sendable {
    public let errors: [UnauthorizedErrorResponseErrorsItem]?

    public init(
        errors: [UnauthorizedErrorResponseErrorsItem]? = nil
    ) {
        self.errors = errors
    }
}
