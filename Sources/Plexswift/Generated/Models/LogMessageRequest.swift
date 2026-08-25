// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct LogMessageRequest: Codable, Hashable, Sendable {
    /// Log level (DEBUG, INFO, WARN, ERROR)
    public let level: LogMessageRequestLevel?

    /// The log message content
    public let message: String?

    /// Source of the log message
    public let source: String?

    public init(
        level: LogMessageRequestLevel? = nil,
        message: String? = nil,
        source: String? = nil
    ) {
        self.level = level
        self.message = message
        self.source = source
    }
}
