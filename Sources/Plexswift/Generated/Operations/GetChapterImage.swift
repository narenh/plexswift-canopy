// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a single chapter image for a piece of media
    public struct GetChapterImage: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getChapterImage"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the media item
        public var mediaId: Int

        /// The index of the chapter
        public var chapter: Int

        public init(
            mediaId: Int,
            chapter: Int
        ) {
            self.mediaId = mediaId
            self.chapter = chapter
        }

        public var path: String { "/library/media/\(PathComponent(mediaId))/chapterImages/\(PathComponent(chapter))" }
    }
}
