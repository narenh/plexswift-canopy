// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PostUsersSignInDataBody: Codable, Hashable, Sendable {
    public let login: String?

    public let password: String?

    public let rememberMe: Bool?

    public let verificationCode: String?

    public init(
        login: String? = nil,
        password: String? = nil,
        rememberMe: Bool? = nil,
        verificationCode: String? = nil
    ) {
        self.login = login
        self.password = password
        self.rememberMe = rememberMe
        self.verificationCode = verificationCode
    }
}
