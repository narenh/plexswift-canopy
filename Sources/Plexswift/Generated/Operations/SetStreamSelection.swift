// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set which streams (audio/subtitle) are selected by this user
    public struct SetStreamSelection: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "setStreamSelection"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the part to select streams on
        public var partId: Int

        /// The id of the audio stream to select in this part
        public var audioStreamID: Int?

        /// The id of the subtitle stream to select in this part. Specify 0 to select no subtitle
        public var subtitleStreamID: Int?

        /// Perform the same for all parts of this media selecting similar streams in each
        public var allParts: BoolInt?

        public init(
            partId: Int,
            audioStreamID: Int? = nil,
            subtitleStreamID: Int? = nil,
            allParts: BoolInt? = nil
        ) {
            self.partId = partId
            self.audioStreamID = audioStreamID
            self.subtitleStreamID = subtitleStreamID
            self.allParts = allParts
        }

        public var path: String { "/library/parts/\(PathComponent(partId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = audioStreamID {
                items.append(URLQueryItem(name: "audioStreamID", value: QueryValue(value).encoded))
            }
            if let value = subtitleStreamID {
                items.append(URLQueryItem(name: "subtitleStreamID", value: QueryValue(value).encoded))
            }
            if let value = allParts {
                items.append(URLQueryItem(name: "allParts", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
