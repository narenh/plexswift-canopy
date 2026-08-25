// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct UnauthorizedErrorResponseErrorsItem: Codable, Hashable, Sendable {
    public let code: Int?

    public let message: String?

    public let status: Int?

    public init(
        code: Int? = nil,
        message: String? = nil,
        status: Int? = nil
    ) {
        self.code = code
        self.message = message
        self.status = status
    }
}
