// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Imports m3u playlists by passing a path on the server to scan for m3u-formatted playlist files,
    /// or a path to a single playlist file.
    public struct UploadPlaylist: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "uploadPlaylist"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Absolute path to a directory on the server where m3u files are stored, or the absolute path to a
        /// playlist file on the server. If the `path` argument is a directory, that path will be scanned
        /// for playlist files to be processed. Each file in that directory creates a separate playlist,
        /// with a name based on the filename of the file that created it. The GUID of each playlist is
        /// based on the filename. If the `path` argument is a file, that file will be used to create a new
        /// playlist, with the name based on the filename of the file that created it. The GUID of each
        /// playlist is based on the filename.
        public var path2: String?

        /// Force overwriting of duplicate playlists. By default, a playlist file uploaded with the same
        /// path will overwrite the existing playlist. The `force` argument is used to disable overwriting.
        /// If the `force` argument is set to 0, a new playlist will be created suffixed with the date and
        /// time that the duplicate was uploaded.
        public var force: BoolInt?

        public init(
            path2: String? = nil,
            force: BoolInt? = nil
        ) {
            self.path2 = path2
            self.force = force
        }

        public var path: String { "/playlists/upload" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = path2 {
                items.append(URLQueryItem(name: "path", value: QueryValue(value).encoded))
            }
            if let value = force {
                items.append(URLQueryItem(name: "force", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
