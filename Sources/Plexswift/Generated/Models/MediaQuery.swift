// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A querystring-based filtering language used to select subsets of media. When provided as an
/// object, properties are serialized as a querystring using form style with explode.
///
/// Only the defined properties below are allowed. The object serializes to a querystring format
/// like: `type=4&sourceType=2&sort=duration:desc,index`
public struct MediaQuery: Codable, Hashable, Sendable {
    /// The type of media to retrieve or filter by.
    public let type: MediaType?

    /// Field to group results by (similar to SQL GROUP BY)
    public let group: String?

    /// Maximum number of results to return
    public let limit: Int?

    /// Field(s) to sort by, with optional modifiers. Use comma to separate multiple fields, and :desc
    /// or :nullsLast for modifiers (e.g., "duration:desc,index")
    public let sort: String?

    /// Change the default level to which fields refer (used with type for hierarchical queries)
    public let sourceType: Int?

    public init(
        type: MediaType? = nil,
        group: String? = nil,
        limit: Int? = nil,
        sort: String? = nil,
        sourceType: Int? = nil
    ) {
        self.type = type
        self.group = group
        self.limit = limit
        self.sort = sort
        self.sourceType = sourceType
    }
}
