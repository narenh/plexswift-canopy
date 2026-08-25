// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Bandwidth: Codable, Hashable, Sendable {
    /// The bandwidth at this time in kbps
    public let bandwidth: Int?

    /// The user-friendly resolution at this time
    public let resolution: String?

    /// Media playback time where this bandwidth started
    public let time: Int?

    public init(
        bandwidth: Int? = nil,
        resolution: String? = nil,
        time: Int? = nil
    ) {
        self.bandwidth = bandwidth
        self.resolution = resolution
        self.time = time
    }
}
