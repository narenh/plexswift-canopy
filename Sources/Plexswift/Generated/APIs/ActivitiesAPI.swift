// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Activities` operations of the Plex API.
///
/// Reached through ``PlexClient/activities``.
public struct ActivitiesAPI: Sendable {
    let client: PlexClient

    /// Cancel a running activity. Admins can cancel all activities but other users can only cancel
    /// their own
    @discardableResult
    public func cancelActivity(
        activityId: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.CancelActivity(
            activityId: activityId
        ))
    }

    /// List all activities on the server. Admins can see all activities but other users can only see
    /// their own
    @discardableResult
    public func listActivities() async throws -> ListActivitiesResponse {
        try await client.perform(Operations.ListActivities())
    }
}

extension PlexClient {
    /// The `Activities` operations of the Plex API.
    public var activities: ActivitiesAPI { ActivitiesAPI(client: self) }
}
