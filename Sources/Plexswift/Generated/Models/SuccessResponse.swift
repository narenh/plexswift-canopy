// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A simple success indicator for operations that return no meaningful data
public struct SuccessResponse: Codable, Hashable, Sendable {
    public let success: Bool?

    public init(
        success: Bool? = nil
    ) {
        self.success = success
    }
}
