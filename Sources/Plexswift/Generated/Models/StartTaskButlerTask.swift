// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum StartTaskButlerTask: String, Codable, Hashable, Sendable, CaseIterable {
    case automaticUpdates = "AutomaticUpdates"
    case backupDatabase = "BackupDatabase"
    case butlerTaskGenerateAdMarkers = "ButlerTaskGenerateAdMarkers"
    case butlerTaskGenerateCreditsMarkers = "ButlerTaskGenerateCreditsMarkers"
    case butlerTaskGenerateIntroMarkers = "ButlerTaskGenerateIntroMarkers"
    case butlerTaskGenerateVoiceActivity = "ButlerTaskGenerateVoiceActivity"
    case cleanOldBundles = "CleanOldBundles"
    case cleanOldCacheFiles = "CleanOldCacheFiles"
    case deepMediaAnalysis = "DeepMediaAnalysis"
    case garbageCollectBlobs = "GarbageCollectBlobs"
    case garbageCollectLibraryMedia = "GarbageCollectLibraryMedia"
    case generateBlurHashes = "GenerateBlurHashes"
    case generateChapterThumbs = "GenerateChapterThumbs"
    case generateMediaIndexFiles = "GenerateMediaIndexFiles"
    case loudnessAnalysis = "LoudnessAnalysis"
    case musicAnalysis = "MusicAnalysis"
    case optimizeDatabase = "OptimizeDatabase"
    case refreshEpgGuides = "RefreshEpgGuides"
    case refreshLibraries = "RefreshLibraries"
    case refreshLocalMedia = "RefreshLocalMedia"
    case refreshPeriodicMetadata = "RefreshPeriodicMetadata"
    case upgradeMediaAnalysis = "UpgradeMediaAnalysis"
}
