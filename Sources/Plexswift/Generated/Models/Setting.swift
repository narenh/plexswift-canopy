// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A configuration setting or preference
public struct Setting: Codable, Hashable, Sendable {
    /// The type of the value of this setting
    public let type: SettingType?

    /// The default value of this setting
    public let `default`: SettingDefault?

    /// Whether the setting is considered advanced and normally hidden from the user
    public let advanced: Bool?

    /// The possible values for this setting if restricted. The list is `|` separated with `value:name`
    /// entries.
    public let enumValues: String?

    /// The group name of this setting to aid in display of a hierarchy
    public let group: String?

    /// Whether the setting is hidden or not
    public let hidden: Bool?

    /// The query parameter name for this setting
    public let id: String?

    /// A user-friendly name for the setting
    public let label: String?

    /// A description of the setting
    public let summary: String?

    /// The current value of this setting
    public let value: SettingValue?

    public init(
        type: SettingType? = nil,
        default: SettingDefault? = nil,
        advanced: Bool? = nil,
        enumValues: String? = nil,
        group: String? = nil,
        hidden: Bool? = nil,
        id: String? = nil,
        label: String? = nil,
        summary: String? = nil,
        value: SettingValue? = nil
    ) {
        self.type = type
        self.`default` = `default`
        self.advanced = advanced
        self.enumValues = enumValues
        self.group = group
        self.hidden = hidden
        self.id = id
        self.label = label
        self.summary = summary
        self.value = value
    }
}
