// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get augmentation status and potentially wait for completion
    public struct GetAugmentationStatus: PlexOperation {
        public typealias Success = EmptyResponse

        public static let operationID = "getAugmentationStatus"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the augmentation
        public var augmentationId: String

        /// Wait for augmentation completion before returning
        public var wait: BoolInt?

        public init(
            augmentationId: String,
            wait: BoolInt? = nil
        ) {
            self.augmentationId = augmentationId
            self.wait = wait
        }

        public var path: String { "/library/metadata/augmentations/\(PathComponent(augmentationId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = wait {
                items.append(URLQueryItem(name: "wait", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
