// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemLocation: String, Codable, Hashable, Sendable, CaseIterable {
    case direct = "direct"
    case sidecarSubs = "sidecar-subs"
    case segmentsVideo = "segments-video"
    case segmentsAudio = "segments-audio"
    case segmentsAv = "segments-av"
    case segmentsSubs = "segments-subs"
    case embedded = "embedded"
    case sidecar = "sidecar"
}
