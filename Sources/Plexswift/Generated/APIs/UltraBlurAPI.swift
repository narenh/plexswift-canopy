// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `UltraBlur` operations of the Plex API.
///
/// Reached through ``PlexClient/ultraBlur``.
public struct UltraBlurAPI: Sendable {
    let client: PlexClient

    /// Retrieves the four colors extracted from an image for clients to use to generate an ultrablur
    /// image.
    @discardableResult
    public func getColors(
        url: String? = nil
    ) async throws(PlexError) -> GetColorsResponse {
        try await client.perform(Operations.GetColors(
            url: url
        ))
    }

    /// Retrieves a server-side generated UltraBlur image based on the provided color inputs. Clients
    /// should always call this via the photo transcoder endpoint.
    @discardableResult
    public func getImage(
        topLeft: String? = nil,
        topRight: String? = nil,
        bottomRight: String? = nil,
        bottomLeft: String? = nil,
        width: Int? = nil,
        height: Int? = nil,
        noise: BoolInt? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetImage(
            topLeft: topLeft,
            topRight: topRight,
            bottomRight: bottomRight,
            bottomLeft: bottomLeft,
            width: width,
            height: height,
            noise: noise
        ))
    }
}

extension PlexClient {
    /// The `UltraBlur` operations of the Plex API.
    public var ultraBlur: UltraBlurAPI { UltraBlurAPI(client: self) }
}
