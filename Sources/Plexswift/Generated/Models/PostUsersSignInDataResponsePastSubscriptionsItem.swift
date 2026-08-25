// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PostUsersSignInDataResponsePastSubscriptionsItem: Codable, Hashable, Sendable {
    public let type: String?

    public let billing: PostUsersSignInDataResponsePastSubscriptionsItemBilling?

    public let canceled: Bool?

    public let canConvert: Bool?

    public let canDowngrade: Bool?

    public let canReactivate: Bool?

    public let canUpgrade: Bool?

    public let endsAt: PostUsersSignInDataResponsePastSubscriptionsItemEndsAt?

    public let gracePeriod: Bool?

    public let id: String?

    public let mode: String?

    public let onHold: Bool?

    public let renewsAt: PostUsersSignInDataResponsePastSubscriptionsItemRenewsAt?

    public let state: PostUsersSignInDataResponsePastSubscriptionsItemState?

    public let transfer: String?

    public init(
        type: String? = nil,
        billing: PostUsersSignInDataResponsePastSubscriptionsItemBilling? = nil,
        canceled: Bool? = nil,
        canConvert: Bool? = nil,
        canDowngrade: Bool? = nil,
        canReactivate: Bool? = nil,
        canUpgrade: Bool? = nil,
        endsAt: PostUsersSignInDataResponsePastSubscriptionsItemEndsAt? = nil,
        gracePeriod: Bool? = nil,
        id: String? = nil,
        mode: String? = nil,
        onHold: Bool? = nil,
        renewsAt: PostUsersSignInDataResponsePastSubscriptionsItemRenewsAt? = nil,
        state: PostUsersSignInDataResponsePastSubscriptionsItemState? = nil,
        transfer: String? = nil
    ) {
        self.type = type
        self.billing = billing
        self.canceled = canceled
        self.canConvert = canConvert
        self.canDowngrade = canDowngrade
        self.canReactivate = canReactivate
        self.canUpgrade = canUpgrade
        self.endsAt = endsAt
        self.gracePeriod = gracePeriod
        self.id = id
        self.mode = mode
        self.onHold = onHold
        self.renewsAt = renewsAt
        self.state = state
        self.transfer = transfer
    }
}
