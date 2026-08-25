// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Creation of a DVR, after creation of a device and a lineup is selected
    public struct CreateDVR: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "createDVR"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The EPG lineup.
        public var lineup: String?

        /// The device.
        public var device: [String]?

        /// The language.
        public var language: String?

        public init(
            lineup: String? = nil,
            device: [String]? = nil,
            language: String? = nil
        ) {
            self.lineup = lineup
            self.device = device
            self.language = language
        }

        public var path: String { "/livetv/dvrs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = lineup {
                items.append(URLQueryItem(name: "lineup", value: QueryValue(value).encoded))
            }
            if let value = device {
                for element in value {
                    items.append(URLQueryItem(name: "device", value: QueryValue(element).encoded))
                }
            }
            if let value = language {
                items.append(URLQueryItem(name: "language", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
