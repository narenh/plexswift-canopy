// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetTemplateResponseMediaContainerSubscriptionTemplateItem: Codable, Hashable, Sendable {
    public let mediaSubscription: [GetTemplateResponseMediaContainerSubscriptionTemplateItemMediaSubscriptionItem]?

    public init(
        mediaSubscription: [GetTemplateResponseMediaContainerSubscriptionTemplateItemMediaSubscriptionItem]? = nil
    ) {
        self.mediaSubscription = mediaSubscription
    }

    private enum CodingKeys: String, CodingKey {
        case mediaSubscription = "MediaSubscription"
    }
}
