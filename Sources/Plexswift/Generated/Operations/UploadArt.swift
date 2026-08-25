// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Upload custom background art for a metadata item.
    public struct UploadArt: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "uploadArt"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the item
        public var id: Int

        /// The request body.
        public var body: Data?

        public init(
            id: Int,
            body: Data? = nil
        ) {
            self.id = id
            self.body = body
        }

        public var path: String { "/library/metadata/\(PathComponent(id))/arts" }

        public func body(encoder: JSONEncoder) throws -> RequestBody? {
            guard let value = self.body else { return nil }
            return RequestBody.multipart(fieldName: "file", data: value)
        }
    }
}
