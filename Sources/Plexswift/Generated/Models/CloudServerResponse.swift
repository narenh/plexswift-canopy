// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct CloudServerResponse: Codable, Hashable, Sendable {
    public let address: String?

    public let name: String?

    public let port: Int?

    public let scheme: String?

    public init(
        address: String? = nil,
        name: String? = nil,
        port: Int? = nil,
        scheme: String? = nil
    ) {
        self.address = address
        self.name = name
        self.port = port
        self.scheme = scheme
    }
}
