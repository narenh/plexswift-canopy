// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Authentication` operations of the Plex API.
///
/// Reached through ``PlexClient/authentication``.
public struct AuthenticationAPI: Sendable {
    let client: PlexClient

    /// Change or reset the logged-in user's password.
    @discardableResult
    public func changePassword() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.ChangePassword())
    }

    /// Legacy PIN creation (XML).
    @discardableResult
    public func createLegacyPin() async throws(PlexError) -> String {
        try await client.perform(Operations.CreateLegacyPin())
    }

    /// Create a 4-character PIN for device linking via OAuth. The user must visit https://plex.tv/link
    /// and enter the PIN to authorize the device.
    @discardableResult
    public func createOAuthPin() async throws(PlexError) -> CreateOAuthPinResponse {
        try await client.perform(Operations.CreateOAuthPin())
    }

    /// Exchange a signed client JWT for a Plex JWT token.
    @discardableResult
    public func exchangeJWTToken(
        body: TokenExchangeRequest? = nil
    ) async throws(PlexError) -> AuthTokenResponse {
        try await client.perform(Operations.ExchangeJWTToken(
            body: body
        ))
    }

    /// Get Plex public JWKs for signature verification.
    @discardableResult
    public func getAuthKeys() async throws(PlexError) -> AuthKeysResponse {
        try await client.perform(Operations.GetAuthKeys())
    }

    /// Get a nonce to sign in client JWT authentication flow.
    @discardableResult
    public func getAuthNonce() async throws(PlexError) -> AuthNonceResponse {
        try await client.perform(Operations.GetAuthNonce())
    }

    /// Get a claim token for new server setup.
    @discardableResult
    public func getClaimToken() async throws(PlexError) -> ClaimTokenResponse {
        try await client.perform(Operations.GetClaimToken())
    }

    /// Get Plex Pass feature flags for the logged-in user.
    @discardableResult
    public func getFeatures() async throws(PlexError) -> GetFeaturesResponse {
        try await client.perform(Operations.GetFeatures())
    }

    /// Poll the PIN status. Returns authToken when the user has linked the device.
    @discardableResult
    public func getOAuthPin(
        pinId: Int
    ) async throws(PlexError) -> GetOAuthPinResponse {
        try await client.perform(Operations.GetOAuthPin(
            pinId: pinId
        ))
    }

    /// List access tokens for the server.
    @discardableResult
    public func getServerAccessTokens() async throws(PlexError) -> ServerAccessTokensResponse {
        try await client.perform(Operations.GetServerAccessTokens())
    }

    /// Get the User data from the provided X-Plex-Token
    @discardableResult
    public func getTokenDetails() async throws(PlexError) -> UserPlexAccount {
        try await client.perform(Operations.GetTokenDetails())
    }

    /// Link a PIN to an account (OAuth completion).
    @discardableResult
    public func linkOAuthPin(
        body: LinkOAuthPinBody? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.LinkOAuthPin(
            body: body
        ))
    }

    /// Health / latency check. No authentication required.
    @discardableResult
    public func ping() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.Ping())
    }

    /// Sign in user with username and password and return user data with Plex authentication token
    @discardableResult
    public func postUsersSignInData(
        body: PostUsersSignInDataBody? = nil
    ) async throws(PlexError) -> PostUsersSignInDataResponse {
        try await client.perform(Operations.PostUsersSignInData(
            body: body
        ))
    }

    /// Register a device public key (JWK) for JWT-based authentication.
    @discardableResult
    public func registerDeviceJWK(
        body: JWKRegistrationRequest? = nil
    ) async throws(PlexError) -> AuthTokenResponse {
        try await client.perform(Operations.RegisterDeviceJWK(
            body: body
        ))
    }

    /// Invalidate the current authentication token.
    @discardableResult
    public func signOut() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SignOut())
    }

    /// Switch to a Plex Home user and return a new auth token.
    @discardableResult
    public func switchHomeUser(
        id: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SwitchHomeUser(
            id: id
        ))
    }
}

extension PlexClient {
    /// The `Authentication` operations of the Plex API.
    public var authentication: AuthenticationAPI { AuthenticationAPI(client: self) }
}
