// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PostUsersSignInDataResponsePastSubscriptionsItemBilling: Codable, Hashable, Sendable {
    public let internalPaymentMethod: AnyJSON?

    public let paymentMethodId: Int?

    public init(
        internalPaymentMethod: AnyJSON? = nil,
        paymentMethodId: Int? = nil
    ) {
        self.internalPaymentMethod = internalPaymentMethod
        self.paymentMethodId = paymentMethodId
    }
}
