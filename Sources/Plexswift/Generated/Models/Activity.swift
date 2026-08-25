// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Activity: Codable, Hashable, Sendable {
    /// A user-friendly title for this activity
    public let title: String?

    /// The type of activity
    public let type: String?

    /// Indicates whether this activity can be cancelled
    public let cancellable: Bool?

    /// An object with additional values
    public let context: AnyJSON?

    /// A progress percentage. A value of -1 means the progress is indeterminate
    public let progress: Double?

    /// An object with the response to the async opperation
    public let response: AnyJSON?

    /// A user-friendly sub-title for this activity
    public let subtitle: String?

    /// The user this activity belongs to
    public let userID: Int?

    /// The ID of the activity
    public let uuid: String?

    public init(
        title: String? = nil,
        type: String? = nil,
        cancellable: Bool? = nil,
        context: AnyJSON? = nil,
        progress: Double? = nil,
        response: AnyJSON? = nil,
        subtitle: String? = nil,
        userID: Int? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.type = type
        self.cancellable = cancellable
        self.context = context
        self.progress = progress
        self.response = response
        self.subtitle = subtitle
        self.userID = userID
        self.uuid = uuid
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case cancellable
        case context = "Context"
        case progress
        case response = "Response"
        case subtitle
        case userID
        case uuid
    }
}
