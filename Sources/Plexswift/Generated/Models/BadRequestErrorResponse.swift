// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct BadRequestErrorResponse: Codable, Hashable, Sendable {
    public let errors: [BadRequestErrorResponseErrorsItem]?

    public init(
        errors: [BadRequestErrorResponseErrorsItem]? = nil
    ) {
        self.errors = errors
    }
}
