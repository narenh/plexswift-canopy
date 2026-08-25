// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Hub: Codable, Hashable, Sendable {
    /// A title for this grouping of content
    public let title: String?

    /// The type of the items contained in this hub, or possibly `mixed` if there are multiple types
    public let type: String?

    public let context: String?

    /// A unique identifier for the hub
    public let hubIdentifier: String?

    /// A key at which the exact content currently displayed can be fetched again. This is particularly
    /// important when a hub is marked as random and requesting the `key` may get different results.
    /// It's otherwise optional.
    public let hubKey: String?

    /// The key at which all of the content for this hub can be retrieved
    public let key: String?

    public let metadata: [Metadata]?

    /// "A boolean indicating that the hub contains more than what's included in the current response."
    public let more: Bool?

    /// Indicating if the hub should be promoted to the user's homescreen
    public let promoted: Bool?

    /// Indicating that the contents of the hub may change on each request
    public let random: Bool?

    /// Reason for hub inclusion (e.g. "because you watched").
    public let reason: String?

    /// ID of the item that triggered the reason.
    public let reasonID: Int?

    /// Human-readable reason title.
    public let reasonTitle: String?

    public let size: Int?

    /// A suggestion on how this hub's contents might be displayed by a client. Some examples include
    /// `hero`, `list`, `spotlight`, and `upsell`
    public let style: String?

    /// The subtype of the items contained in this hub, or possibly `mixed` if there are multiple types
    public let subtype: String?

    public let totalSize: Int?

    public init(
        title: String? = nil,
        type: String? = nil,
        context: String? = nil,
        hubIdentifier: String? = nil,
        hubKey: String? = nil,
        key: String? = nil,
        metadata: [Metadata]? = nil,
        more: Bool? = nil,
        promoted: Bool? = nil,
        random: Bool? = nil,
        reason: String? = nil,
        reasonID: Int? = nil,
        reasonTitle: String? = nil,
        size: Int? = nil,
        style: String? = nil,
        subtype: String? = nil,
        totalSize: Int? = nil
    ) {
        self.title = title
        self.type = type
        self.context = context
        self.hubIdentifier = hubIdentifier
        self.hubKey = hubKey
        self.key = key
        self.metadata = metadata
        self.more = more
        self.promoted = promoted
        self.random = random
        self.reason = reason
        self.reasonID = reasonID
        self.reasonTitle = reasonTitle
        self.size = size
        self.style = style
        self.subtype = subtype
        self.totalSize = totalSize
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case context
        case hubIdentifier
        case hubKey
        case key
        case metadata = "Metadata"
        case more
        case promoted
        case random
        case reason
        case reasonID
        case reasonTitle
        case size
        case style
        case subtype
        case totalSize
    }
}
