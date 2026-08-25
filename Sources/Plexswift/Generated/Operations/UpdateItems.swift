// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint takes an large possible set of values. Here are some examples.
    /// - **Parameters, extra documentation**
    /// - artist.title.value
    /// - When used with track, both artist.title.value and album.title.value need to be specified
    /// - title.value usage
    /// - Summary
    /// - Tracks always rename and never merge
    /// - Albums and Artists
    /// - if single item and item without title does not exist, it is renamed.
    /// - if single item and item with title does exist they are merged.
    /// - if multiple they are always merged.
    /// - Tracks
    /// - Works as expected will update the track's title
    /// - Single track:    `/library/sections/{id}/all?type=10&id=42&title.value=NewName`
    /// - Multiple tracks: `/library/sections/{id}/all?type=10&id=42,43,44&title.value=NewName`
    /// - All tracks:      `/library/sections/{id}/all?type=10&title.value=NewName`
    /// - Albums
    /// - Functionality changes depending on the existence of an album with the same title
    /// - Album exists
    /// - Single album: `/library/sections/{id}/all?type=9&id=42&title.value=Album 2`
    /// - Album with id 42 is merged into album titled "Album 2"
    /// - Multiple/All albums: `/library/sections/{id}/all?type=9&title.value=Moo Album`
    /// - All albums are merged into the existing album titled "Moo Album"
    /// - Album does not exist
    /// - Single album: `/library/sections/{id}/all?type=9&id=42&title.value=NewAlbumTitle`
    /// - Album with id 42 has title modified to "NewAlbumTitle"
    /// - Multiple/All albums: `/library/sections/{id}/all?type=9&title.value=NewAlbumTitle`
    /// - All albums are merged into a new album with title="NewAlbumTitle"
    /// - Artists
    /// - Functionaly changes depending on the existence of an artist with the same title.
    /// - Artist exists
    /// - Single artist: `/library/sections/{id}/all?type=8&id=42&title.value=Artist 2`
    /// - Artist with id 42 is merged into existing artist titled "Artist 2"
    /// - Multiple/All artists: `/library/sections/{id}/all?type=8&title.value=Artist 3`
    /// - All artists are merged into the existing artist titled "Artist 3"
    /// - Artist does not exist
    /// - Single artist: `/library/sections/{id}/all?type=8&id=42&title.value=NewArtistTitle`
    /// - Artist with id 42 has title modified to "NewArtistTitle"
    /// - Multiple/All artists: `/library/sections/{id}/all?type=8&title.value=NewArtistTitle`
    /// - All artists are merged into a new artist with title="NewArtistTitle"
    ///
    /// - **Notes**
    /// - Technically square brackets are not allowed in an URI except the Internet Protocol Literal Address
    /// - RFC3513: A host identified by an Internet Protocol literal address, version 6 [RFC3513] or later, is distinguished by enclosing the IP literal within square brackets ("[" and "]"). This is the only place where square bracket characters are allowed in the URI syntax.
    /// - Escaped square brackets are allowed, but don't render well
    public struct UpdateItems: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "updateItems"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the section
        public var sectionId: String

        /// The media type to filter by
        public var type: String?

        /// The filters to apply to determine which items should be modified
        public var filters: String?

        /// Set the specified field to a new value
        public var fieldValue: String?

        /// Set the specified field to locked (or unlocked if set to 0)
        public var fieldLocked: BoolInt?

        /// This field is treated specially by albums or artists and may be used for implicit reparenting.
        public var titleValue: String?

        /// Reparents set of Tracks or Albums - used with album.title.* in the case of tracks
        public var artistTitleValue: String?

        /// Reparents set of Tracks or Albums - used with album.title.* in the case of tracks
        public var artistTitleId: String?

        /// Reparents set of Tracks - Must be used in conjunction with artist.title.value or id
        public var albumTitleValue: String?

        /// Reparents set of Tracks - Must be used in conjunction with artist.title.value or id
        public var albumTitleId: String?

        /// Creates tag and associates it with each item in the set. - [idx] links this and the next
        /// parameters together
        public var tagtypeIdxTagTag: String?

        /// Here `object` may be text/thumb/art/theme - Optionally used in conjunction with tag.tag, to
        /// update association info across the set.
        public var tagtypeIdxTaggingObject: String?

        /// Remove comma separated tags from the set of items
        public var tagtypeTagTag: String?

        /// Remove associations of this type (e.g. genre) from the set of items
        public var tagtypeTag: String?

        public init(
            sectionId: String,
            type: String? = nil,
            filters: String? = nil,
            fieldValue: String? = nil,
            fieldLocked: BoolInt? = nil,
            titleValue: String? = nil,
            artistTitleValue: String? = nil,
            artistTitleId: String? = nil,
            albumTitleValue: String? = nil,
            albumTitleId: String? = nil,
            tagtypeIdxTagTag: String? = nil,
            tagtypeIdxTaggingObject: String? = nil,
            tagtypeTagTag: String? = nil,
            tagtypeTag: String? = nil
        ) {
            self.sectionId = sectionId
            self.type = type
            self.filters = filters
            self.fieldValue = fieldValue
            self.fieldLocked = fieldLocked
            self.titleValue = titleValue
            self.artistTitleValue = artistTitleValue
            self.artistTitleId = artistTitleId
            self.albumTitleValue = albumTitleValue
            self.albumTitleId = albumTitleId
            self.tagtypeIdxTagTag = tagtypeIdxTagTag
            self.tagtypeIdxTaggingObject = tagtypeIdxTaggingObject
            self.tagtypeTagTag = tagtypeTagTag
            self.tagtypeTag = tagtypeTag
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/all" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            if let value = filters {
                items.append(URLQueryItem(name: "filters", value: QueryValue(value).encoded))
            }
            if let value = fieldValue {
                items.append(URLQueryItem(name: "field.value", value: QueryValue(value).encoded))
            }
            if let value = fieldLocked {
                items.append(URLQueryItem(name: "field.locked", value: QueryValue(value).encoded))
            }
            if let value = titleValue {
                items.append(URLQueryItem(name: "title.value", value: QueryValue(value).encoded))
            }
            if let value = artistTitleValue {
                items.append(URLQueryItem(name: "artist.title.value", value: QueryValue(value).encoded))
            }
            if let value = artistTitleId {
                items.append(URLQueryItem(name: "artist.title.id", value: QueryValue(value).encoded))
            }
            if let value = albumTitleValue {
                items.append(URLQueryItem(name: "album.title.value", value: QueryValue(value).encoded))
            }
            if let value = albumTitleId {
                items.append(URLQueryItem(name: "album.title.id", value: QueryValue(value).encoded))
            }
            if let value = tagtypeIdxTagTag {
                items.append(URLQueryItem(name: "tagtype[idx].tag.tag", value: QueryValue(value).encoded))
            }
            if let value = tagtypeIdxTaggingObject {
                items.append(URLQueryItem(name: "tagtype[idx].tagging.object", value: QueryValue(value).encoded))
            }
            if let value = tagtypeTagTag {
                items.append(URLQueryItem(name: "tagtype[].tag.tag-", value: QueryValue(value).encoded))
            }
            if let value = tagtypeTag {
                items.append(URLQueryItem(name: "tagtype[].tag", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
