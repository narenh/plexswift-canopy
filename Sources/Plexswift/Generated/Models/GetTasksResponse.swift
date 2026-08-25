// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetTasksResponse: Codable, Hashable, Sendable {
    public let butlerTasks: GetTasksResponseButlerTasks?

    public init(
        butlerTasks: GetTasksResponseButlerTasks? = nil
    ) {
        self.butlerTasks = butlerTasks
    }

    private enum CodingKeys: String, CodingKey {
        case butlerTasks = "ButlerTasks"
    }
}
