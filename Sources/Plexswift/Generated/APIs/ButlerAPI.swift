// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Butler` operations of the Plex API.
///
/// Reached through ``PlexClient/butler``.
public struct ButlerAPI: Sendable {
    let client: PlexClient

    /// Get the list of butler tasks and their scheduling
    @discardableResult
    public func getTasks() async throws -> GetTasksResponse {
        try await client.perform(Operations.GetTasks())
    }

    /// This endpoint will attempt to start a specific Butler task by name.
    @discardableResult
    public func startTask(
        butlerTask: StartTaskButlerTask
    ) async throws -> EmptyResponse {
        try await client.perform(Operations.StartTask(
            butlerTask: butlerTask
        ))
    }

    /// This endpoint will attempt to start all Butler tasks that are enabled in the settings. Butler
    /// tasks normally run automatically during a time window configured on the server's Settings page
    /// but can be manually started using this endpoint. Tasks will run with the following criteria:
    ///
    /// 1. Any tasks not scheduled to run on the current day will be skipped.
    /// 2. If a task is configured to run at a random time during the configured window and we are outside that window, the task will start immediately.
    /// 3. If a task is configured to run at a random time during the configured window and we are within that window, the task will be scheduled at a random time within the window.
    /// 4. If we are outside the configured window, the task will start immediately.
    @discardableResult
    public func startTasks() async throws -> SuccessResponse {
        try await client.perform(Operations.StartTasks())
    }

    /// This endpoint will stop a currently running task by name, or remove it from the list of
    /// scheduled tasks if it exists
    @discardableResult
    public func stopTask(
        butlerTask: StopTaskButlerTask
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.StopTask(
            butlerTask: butlerTask
        ))
    }

    /// This endpoint will stop all currently running tasks and remove any scheduled tasks from the
    /// queue.
    @discardableResult
    public func stopTasks() async throws -> SuccessResponse {
        try await client.perform(Operations.StopTasks())
    }
}

extension PlexClient {
    /// The `Butler` operations of the Plex API.
    public var butler: ButlerAPI { ButlerAPI(client: self) }
}
