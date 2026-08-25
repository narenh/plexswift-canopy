// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetUsersResponseMediaContainerUserItem: Codable, Hashable, Sendable {
    /// User's display name.
    public let title: String?

    /// Indicates if the user is allowed to upload from a camera.
    public let allowCameraUpload: GetUsersResponseMediaContainerUserItemAllowCameraUpload?

    /// Indicates if the user has access to channels.
    public let allowChannels: GetUsersResponseMediaContainerUserItemAllowChannels?

    /// Indicates if the user can manage subtitles.
    public let allowSubtitleAdmin: GetUsersResponseMediaContainerUserItemAllowSubtitleAdmin?

    /// Indicates if the user is allowed to sync media.
    public let allowSync: GetUsersResponseMediaContainerUserItemAllowSync?

    /// Indicates if the user is allowed to use tuners.
    public let allowTuners: GetUsersResponseMediaContainerUserItemAllowTuners?

    /// User's email address.
    public let email: String?

    /// Filters applied for all content.
    public let filterAll: String?

    /// Filters applied for movies.
    public let filterMovies: String?

    /// Filters applied for music.
    public let filterMusic: String?

    /// Filters applied for photos.
    public let filterPhotos: String?

    /// Filters applied for television.
    public let filterTelevision: String?

    /// Indicates if the user is part of a home group.
    public let home: GetUsersResponseMediaContainerUserItemHome?

    /// User's unique ID.
    public let id: Int?

    /// Indicates whether the account is protected.
    public let protected: GetUsersResponseMediaContainerUserItemProtected?

    /// ID of the user's recommendation playlist.
    public let recommendationsPlaylistId: String?

    /// Indicates if the user has restricted access.
    public let restricted: GetUsersResponseMediaContainerUserItemRestricted?

    /// List of servers owned by the user.
    public let server: [GetUsersResponseMediaContainerUserItemServerItem]?

    /// URL to the user's avatar image.
    public let thumb: String?

    /// User's username.
    public let username: String?

    public init(
        title: String? = nil,
        allowCameraUpload: GetUsersResponseMediaContainerUserItemAllowCameraUpload? = nil,
        allowChannels: GetUsersResponseMediaContainerUserItemAllowChannels? = nil,
        allowSubtitleAdmin: GetUsersResponseMediaContainerUserItemAllowSubtitleAdmin? = nil,
        allowSync: GetUsersResponseMediaContainerUserItemAllowSync? = nil,
        allowTuners: GetUsersResponseMediaContainerUserItemAllowTuners? = nil,
        email: String? = nil,
        filterAll: String? = nil,
        filterMovies: String? = nil,
        filterMusic: String? = nil,
        filterPhotos: String? = nil,
        filterTelevision: String? = nil,
        home: GetUsersResponseMediaContainerUserItemHome? = nil,
        id: Int? = nil,
        protected: GetUsersResponseMediaContainerUserItemProtected? = nil,
        recommendationsPlaylistId: String? = nil,
        restricted: GetUsersResponseMediaContainerUserItemRestricted? = nil,
        server: [GetUsersResponseMediaContainerUserItemServerItem]? = nil,
        thumb: String? = nil,
        username: String? = nil
    ) {
        self.title = title
        self.allowCameraUpload = allowCameraUpload
        self.allowChannels = allowChannels
        self.allowSubtitleAdmin = allowSubtitleAdmin
        self.allowSync = allowSync
        self.allowTuners = allowTuners
        self.email = email
        self.filterAll = filterAll
        self.filterMovies = filterMovies
        self.filterMusic = filterMusic
        self.filterPhotos = filterPhotos
        self.filterTelevision = filterTelevision
        self.home = home
        self.id = id
        self.protected = protected
        self.recommendationsPlaylistId = recommendationsPlaylistId
        self.restricted = restricted
        self.server = server
        self.thumb = thumb
        self.username = username
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case allowCameraUpload
        case allowChannels
        case allowSubtitleAdmin
        case allowSync
        case allowTuners
        case email
        case filterAll
        case filterMovies
        case filterMusic
        case filterPhotos
        case filterTelevision
        case home
        case id
        case protected
        case recommendationsPlaylistId
        case restricted
        case server = "Server"
        case thumb
        case username
    }
}
