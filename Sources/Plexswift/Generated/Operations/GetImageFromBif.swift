// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Extract an image from the BIF for a part at a particular offset
    public struct GetImageFromBif: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getImageFromBif"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The part id who's index is to be fetched
        public var partId: Int

        /// The type of index to grab.
        public var index: GetImageFromBifIndex

        /// The offset to seek in ms.
        public var offset: Int

        public init(
            partId: Int,
            index: GetImageFromBifIndex,
            offset: Int
        ) {
            self.partId = partId
            self.index = index
            self.offset = offset
        }

        public var path: String { "/library/parts/\(PathComponent(partId))/indexes/\(PathComponent(index))/\(PathComponent(offset))" }
    }
}
