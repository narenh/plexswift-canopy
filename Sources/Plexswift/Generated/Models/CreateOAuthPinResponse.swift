// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct CreateOAuthPinResponse: Codable, Hashable, Sendable {
    public let authToken: String?

    public let clientIdentifier: String?

    public let code: String?

    public let createdAt: String?

    public let expiresAt: String?

    public let expiresIn: Int?

    public let id: Int?

    public let newRegistration: Bool?

    public let product: String?

    public let qr: String?

    public let trusted: Bool?

    public init(
        authToken: String? = nil,
        clientIdentifier: String? = nil,
        code: String? = nil,
        createdAt: String? = nil,
        expiresAt: String? = nil,
        expiresIn: Int? = nil,
        id: Int? = nil,
        newRegistration: Bool? = nil,
        product: String? = nil,
        qr: String? = nil,
        trusted: Bool? = nil
    ) {
        self.authToken = authToken
        self.clientIdentifier = clientIdentifier
        self.code = code
        self.createdAt = createdAt
        self.expiresAt = expiresAt
        self.expiresIn = expiresIn
        self.id = id
        self.newRegistration = newRegistration
        self.product = product
        self.qr = qr
        self.trusted = trusted
    }
}
