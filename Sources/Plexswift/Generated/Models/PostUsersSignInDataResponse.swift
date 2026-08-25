// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PostUsersSignInDataResponse: Codable, Hashable, Sendable {
    /// The title of the account (username or friendly name)
    public let title: String?

    /// Unknown
    public let adsConsent: Bool?

    public let adsConsentReminderAt: PostUsersSignInDataResponseAdsConsentReminderAt?

    public let adsConsentSetAt: PostUsersSignInDataResponseAdsConsentSetAt?

    /// Unknown
    public let anonymous: Bool?

    public let attributionPartner: String?

    /// The account token
    public let authToken: String?

    /// If the two-factor authentication backup codes have been created
    public let backupCodesCreated: Bool?

    /// If the account has been confirmed
    public let confirmed: Bool?

    /// The account country
    public let country: String?

    /// The account email address
    public let email: String?

    /// If login with email only is enabled
    public let emailOnlyAuth: Bool?

    /// List of devices your allowed to use with this account
    public let entitlements: [String]?

    /// If experimental features are enabled
    public let experimentalFeatures: Bool?

    /// Your account full name
    public let friendlyName: String?

    /// If the account is a Plex Home guest user
    public let guest: Bool?

    /// If the account has a password
    public let hasPassword: Bool?

    /// If the account is a Plex Home user
    public let home: Bool?

    /// If the account is the Plex Home admin
    public let homeAdmin: Bool?

    /// The number of accounts in the Plex Home
    public let homeSize: Int?

    /// The Plex account ID
    public let id: Int?

    /// Unix epoch datetime in seconds
    public let joinedAt: PlexDateTime?

    /// The account locale
    public let locale: String?

    /// If you are subscribed to the Plex newsletter
    public let mailingListActive: Bool?

    /// Your current mailing list status
    public let mailingListStatus: PostUsersSignInDataResponseMailingListStatus?

    /// The maximum number of accounts allowed in the Plex Home
    public let maxHomeSize: Int?

    /// [Might be removed] The hashed Plex Home PIN
    ///
    /// - Warning: Deprecated in the Plex API.
    public let pin: String?

    public let profile: UserProfile?

    /// If the account has a Plex Home PIN enabled
    public let protected: Bool?

    /// Unix epoch datetime in seconds
    public let rememberExpiresAt: PlexDateTime?

    /// If the account is a Plex Home managed user
    public let restricted: Bool?

    /// [Might be removed] List of account roles. Plexpass membership listed here
    public let roles: [String]?

    /// Unknown
    public let scrobbleTypes: String?

    public let services: [PostUsersSignInDataResponseServicesItem]?

    /// If the account's Plex Pass subscription is active
    public let subscription: PostUsersSignInDataResponseSubscription?

    /// Description of the Plex Pass subscription
    public let subscriptionDescription: String?

    public let subscriptions: [PostUsersSignInDataResponseSubscriptionsItem]?

    /// URL of the account thumbnail
    public let thumb: String?

    /// If two-factor authentication is enabled
    public let twoFactorEnabled: Bool?

    /// The account username
    public let username: String?

    /// The account UUID
    public let uuid: String?

    public let pastSubscriptions: [PostUsersSignInDataResponsePastSubscriptionsItem]?

    public let trials: [AnyJSON]?

    public init(
        title: String? = nil,
        adsConsent: Bool? = nil,
        adsConsentReminderAt: PostUsersSignInDataResponseAdsConsentReminderAt? = nil,
        adsConsentSetAt: PostUsersSignInDataResponseAdsConsentSetAt? = nil,
        anonymous: Bool? = nil,
        attributionPartner: String? = nil,
        authToken: String? = nil,
        backupCodesCreated: Bool? = nil,
        confirmed: Bool? = nil,
        country: String? = nil,
        email: String? = nil,
        emailOnlyAuth: Bool? = nil,
        entitlements: [String]? = nil,
        experimentalFeatures: Bool? = nil,
        friendlyName: String? = nil,
        guest: Bool? = nil,
        hasPassword: Bool? = nil,
        home: Bool? = nil,
        homeAdmin: Bool? = nil,
        homeSize: Int? = nil,
        id: Int? = nil,
        joinedAt: PlexDateTime? = nil,
        locale: String? = nil,
        mailingListActive: Bool? = nil,
        mailingListStatus: PostUsersSignInDataResponseMailingListStatus? = nil,
        maxHomeSize: Int? = nil,
        pin: String? = nil,
        profile: UserProfile? = nil,
        protected: Bool? = nil,
        rememberExpiresAt: PlexDateTime? = nil,
        restricted: Bool? = nil,
        roles: [String]? = nil,
        scrobbleTypes: String? = nil,
        services: [PostUsersSignInDataResponseServicesItem]? = nil,
        subscription: PostUsersSignInDataResponseSubscription? = nil,
        subscriptionDescription: String? = nil,
        subscriptions: [PostUsersSignInDataResponseSubscriptionsItem]? = nil,
        thumb: String? = nil,
        twoFactorEnabled: Bool? = nil,
        username: String? = nil,
        uuid: String? = nil,
        pastSubscriptions: [PostUsersSignInDataResponsePastSubscriptionsItem]? = nil,
        trials: [AnyJSON]? = nil
    ) {
        self.title = title
        self.adsConsent = adsConsent
        self.adsConsentReminderAt = adsConsentReminderAt
        self.adsConsentSetAt = adsConsentSetAt
        self.anonymous = anonymous
        self.attributionPartner = attributionPartner
        self.authToken = authToken
        self.backupCodesCreated = backupCodesCreated
        self.confirmed = confirmed
        self.country = country
        self.email = email
        self.emailOnlyAuth = emailOnlyAuth
        self.entitlements = entitlements
        self.experimentalFeatures = experimentalFeatures
        self.friendlyName = friendlyName
        self.guest = guest
        self.hasPassword = hasPassword
        self.home = home
        self.homeAdmin = homeAdmin
        self.homeSize = homeSize
        self.id = id
        self.joinedAt = joinedAt
        self.locale = locale
        self.mailingListActive = mailingListActive
        self.mailingListStatus = mailingListStatus
        self.maxHomeSize = maxHomeSize
        self.pin = pin
        self.profile = profile
        self.protected = protected
        self.rememberExpiresAt = rememberExpiresAt
        self.restricted = restricted
        self.roles = roles
        self.scrobbleTypes = scrobbleTypes
        self.services = services
        self.subscription = subscription
        self.subscriptionDescription = subscriptionDescription
        self.subscriptions = subscriptions
        self.thumb = thumb
        self.twoFactorEnabled = twoFactorEnabled
        self.username = username
        self.uuid = uuid
        self.pastSubscriptions = pastSubscriptions
        self.trials = trials
    }
}
