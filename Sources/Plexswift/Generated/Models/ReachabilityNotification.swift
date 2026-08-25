// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Server reachability status change notification
public struct ReachabilityNotification: Codable, Hashable, Sendable {
    public let status: String?

    public init(
        status: String? = nil
    ) {
        self.status = status
    }
}
