// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A list of media times and bandwidths when trascoding is using with auto adjustment of bandwidth
public struct ReportResponseMediaContainerBandwidths: Codable, Hashable, Sendable {
    public let bandwidth: [Bandwidth]?

    public init(
        bandwidth: [Bandwidth]? = nil
    ) {
        self.bandwidth = bandwidth
    }

    private enum CodingKeys: String, CodingKey {
        case bandwidth = "Bandwidth"
    }
}
