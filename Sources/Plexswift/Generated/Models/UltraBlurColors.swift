// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct UltraBlurColors: Codable, Hashable, Sendable {
    /// The color (hex) for the bottom left quadrant.
    public let bottomLeft: String?

    /// The color (hex) for the bottom right quadrant.
    public let bottomRight: String?

    /// The color (hex) for the top left quadrant.
    public let topLeft: String?

    /// The color (hex) for the top right quadrant.
    public let topRight: String?

    public init(
        bottomLeft: String? = nil,
        bottomRight: String? = nil,
        topLeft: String? = nil,
        topRight: String? = nil
    ) {
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
        self.topLeft = topLeft
        self.topRight = topRight
    }
}
