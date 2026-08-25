// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ButlerTask: Codable, Hashable, Sendable {
    /// A user-friendly title of the task
    public let title: String?

    /// A user-friendly description of the task
    public let description: String?

    /// Whether this task is enabled or not
    public let enabled: Bool?

    /// The interval (in days) of when this task is run. A value of 1 is run every day, 7 is every week,
    /// etc.
    public let interval: Int?

    /// The name of the task
    public let name: String?

    /// Indicates whether the timing of the task is randomized within the butler interval
    public let scheduleRandomized: Bool?

    public init(
        title: String? = nil,
        description: String? = nil,
        enabled: Bool? = nil,
        interval: Int? = nil,
        name: String? = nil,
        scheduleRandomized: Bool? = nil
    ) {
        self.title = title
        self.description = description
        self.enabled = enabled
        self.interval = interval
        self.name = name
        self.scheduleRandomized = scheduleRandomized
    }
}
