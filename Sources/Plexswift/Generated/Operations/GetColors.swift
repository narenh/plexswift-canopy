// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Retrieves the four colors extracted from an image for clients to use to generate an ultrablur
    /// image.
    public struct GetColors: PlexOperation {
        public typealias Success = GetColorsResponse

        public static let operationID = "getColors"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Url for image which requires color extraction. Can be relative PMS library path or absolute url.
        public var url: String?

        public init(
            url: String? = nil
        ) {
            self.url = url
        }

        public var path: String { "/services/ultrablur/colors" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = url {
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
