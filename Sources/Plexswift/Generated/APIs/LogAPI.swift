// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Log` operations of the Plex API.
///
/// Reached through ``PlexClient/log``.
public struct LogAPI: Sendable {
    let client: PlexClient

    /// This endpoint will enable all Plex Media Server logs to be sent to the Papertrail networked
    /// logging site for a period of time
    ///
    /// Note: This endpoint responds to all HTTP verbs but POST is preferred
    @discardableResult
    public func enablePapertrail(
        minutes: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EnablePapertrail(
            minutes: minutes
        ))
    }

    /// This endpoint will write multiple lines to the main Plex Media Server log in a single request.
    /// It takes a set of query strings as would normally sent to the above PUT endpoint as a
    /// linefeed-separated block of POST data. The parameters for each query string match as above.
    @discardableResult
    public func writeLog(
        body: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.WriteLog(
            body: body
        ))
    }

    /// This endpoint will write a single-line log message, including a level and source to the main
    /// Plex Media Server log.
    ///
    /// Note: This endpoint responds to all HTTP verbs **except POST** but PUT is preferred
    @discardableResult
    public func writeMessage(
        level: WriteMessageLevel? = nil,
        message: String? = nil,
        source: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.WriteMessage(
            level: level,
            message: message,
            source: source
        ))
    }
}

extension PlexClient {
    /// The `Log` operations of the Plex API.
    public var log: LogAPI { LogAPI(client: self) }
}
