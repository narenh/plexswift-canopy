// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct UserProfile: Codable, Hashable, Sendable {
    /// If the account has automatically select audio and subtitle tracks enabled
    public let autoSelectAudio: Bool?

    /// The auto-select subtitle mode (0 = Manually selected, 1 = Shown with foreign audio, 2 = Always
    /// enabled)
    public let autoSelectSubtitle: UserProfileAutoSelectSubtitle?

    /// The audio accessibility mode (0 = Prefer non-accessibility audio, 1 = Prefer accessibility
    /// audio, 2 = Only show accessibility audio, 3 = Only show non-accessibility audio)
    public let defaultAudioAccessibility: UserProfileDefaultAudioAccessibility?

    /// The preferred audio language for the account
    public let defaultAudioLanguage: String?

    /// The preferred audio languages for the account
    public let defaultAudioLanguages: [String]?

    /// The subtitles for the deaf or hard-of-hearing (SDH) searches mode (0 = Prefer non-SDH subtitles,
    /// 1 = Prefer SDH subtitles, 2 = Only show SDH subtitles, 3 = Only show non-SDH subtitles)
    public let defaultSubtitleAccessibility: UserProfileDefaultSubtitleAccessibility?

    /// The forced subtitles searches mode (0 = Prefer non-forced subtitles, 1 = Prefer forced
    /// subtitles, 2 = Only show forced subtitles, 3 = Only show non-forced subtitles)
    public let defaultSubtitleForced: UserProfileDefaultSubtitleForced?

    /// The preferred subtitle language for the account
    public let defaultSubtitleLanguage: String?

    /// The preferred subtitle languages for the account
    public let defaultSubtitleLanguages: [String]?

    /// The languages for media reviews visibility
    public let mediaReviewsLanguages: [String]?

    /// Whether or not the account has media reviews visibility enabled
    public let mediaReviewsVisibility: UserProfileMediaReviewsVisibility?

    /// Whether or not media watched indicators are enabled (little orange dot on media)
    public let watchedIndicator: UserProfileWatchedIndicator?

    public init(
        autoSelectAudio: Bool? = nil,
        autoSelectSubtitle: UserProfileAutoSelectSubtitle? = nil,
        defaultAudioAccessibility: UserProfileDefaultAudioAccessibility? = nil,
        defaultAudioLanguage: String? = nil,
        defaultAudioLanguages: [String]? = nil,
        defaultSubtitleAccessibility: UserProfileDefaultSubtitleAccessibility? = nil,
        defaultSubtitleForced: UserProfileDefaultSubtitleForced? = nil,
        defaultSubtitleLanguage: String? = nil,
        defaultSubtitleLanguages: [String]? = nil,
        mediaReviewsLanguages: [String]? = nil,
        mediaReviewsVisibility: UserProfileMediaReviewsVisibility? = nil,
        watchedIndicator: UserProfileWatchedIndicator? = nil
    ) {
        self.autoSelectAudio = autoSelectAudio
        self.autoSelectSubtitle = autoSelectSubtitle
        self.defaultAudioAccessibility = defaultAudioAccessibility
        self.defaultAudioLanguage = defaultAudioLanguage
        self.defaultAudioLanguages = defaultAudioLanguages
        self.defaultSubtitleAccessibility = defaultSubtitleAccessibility
        self.defaultSubtitleForced = defaultSubtitleForced
        self.defaultSubtitleLanguage = defaultSubtitleLanguage
        self.defaultSubtitleLanguages = defaultSubtitleLanguages
        self.mediaReviewsLanguages = mediaReviewsLanguages
        self.mediaReviewsVisibility = mediaReviewsVisibility
        self.watchedIndicator = watchedIndicator
    }
}
