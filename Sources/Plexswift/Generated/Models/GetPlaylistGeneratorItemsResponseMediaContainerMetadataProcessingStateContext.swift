// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The error which could have occurred (or `good`)
public enum GetPlaylistGeneratorItemsResponseMediaContainerMetadataProcessingStateContext: String, Codable, Hashable, Sendable, CaseIterable {
    case good = "good"
    case sourceFileUnavailable = "sourceFileUnavailable"
    case sourceFileMetadataError = "sourceFileMetadataError"
    case clientProfileError = "clientProfileError"
    case ioError = "ioError"
    case transcoderError = "transcoderError"
    case unknownError = "unknownError"
    case mediaAnalysisError = "mediaAnalysisError"
    case downloadFailed = "downloadFailed"
    case accessDenied = "accessDenied"
    case cannotTranscode = "cannotTranscode"
    case codecInstallError = "codecInstallError"
}
