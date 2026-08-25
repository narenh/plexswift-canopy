// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetTasksResponseButlerTasks: Codable, Hashable, Sendable {
    public let butlerTask: [ButlerTask]?

    public init(
        butlerTask: [ButlerTask]? = nil
    ) {
        self.butlerTask = butlerTask
    }

    private enum CodingKeys: String, CodingKey {
        case butlerTask = "ButlerTask"
    }
}
