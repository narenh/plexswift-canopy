// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Retrieves a server-side generated UltraBlur image based on the provided color inputs. Clients
    /// should always call this via the photo transcoder endpoint.
    public struct GetImage: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getImage"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The base color (hex) for the top left quadrant.
        public var topLeft: String?

        /// The base color (hex) for the top right quadrant.
        public var topRight: String?

        /// The base color (hex) for the bottom right quadrant.
        public var bottomRight: String?

        /// The base color (hex) for the bottom left quadrant.
        public var bottomLeft: String?

        /// Width in pixels for the image.
        public var width: Int?

        /// Height in pixels for the image.
        public var height: Int?

        /// Whether to add noise to the ouput image. Noise can reduce color banding with the gradients.
        /// Image sizes with noise will be larger.
        public var noise: BoolInt?

        public init(
            topLeft: String? = nil,
            topRight: String? = nil,
            bottomRight: String? = nil,
            bottomLeft: String? = nil,
            width: Int? = nil,
            height: Int? = nil,
            noise: BoolInt? = nil
        ) {
            self.topLeft = topLeft
            self.topRight = topRight
            self.bottomRight = bottomRight
            self.bottomLeft = bottomLeft
            self.width = width
            self.height = height
            self.noise = noise
        }

        public var path: String { "/services/ultrablur/image" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = topLeft {
                items.append(URLQueryItem(name: "topLeft", value: QueryValue(value).encoded))
            }
            if let value = topRight {
                items.append(URLQueryItem(name: "topRight", value: QueryValue(value).encoded))
            }
            if let value = bottomRight {
                items.append(URLQueryItem(name: "bottomRight", value: QueryValue(value).encoded))
            }
            if let value = bottomLeft {
                items.append(URLQueryItem(name: "bottomLeft", value: QueryValue(value).encoded))
            }
            if let value = width {
                items.append(URLQueryItem(name: "width", value: QueryValue(value).encoded))
            }
            if let value = height {
                items.append(URLQueryItem(name: "height", value: QueryValue(value).encoded))
            }
            if let value = noise {
                items.append(URLQueryItem(name: "noise", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
