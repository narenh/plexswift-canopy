// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Rate` operations of the Plex API.
///
/// Reached through ``PlexClient/rate``.
public struct RateAPI: Sendable {
    let client: PlexClient

    /// Set the rating on an item.
    /// This API does respond to the GET verb but applications should use PUT
    @discardableResult
    public func setRating(
        identifier: String,
        key: String,
        rating: Double,
        ratedAt: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SetRating(
            identifier: identifier,
            key: key,
            rating: rating,
            ratedAt: ratedAt
        ))
    }
}

extension PlexClient {
    /// The `Rate` operations of the Plex API.
    public var rate: RateAPI { RateAPI(client: self) }
}
