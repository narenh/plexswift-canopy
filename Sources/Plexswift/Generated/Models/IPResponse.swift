// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct IPResponse: Codable, Hashable, Sendable {
    /// The public IP address
    public let ip: String?

    public init(
        ip: String? = nil
    ) {
        self.ip = ip
    }
}
