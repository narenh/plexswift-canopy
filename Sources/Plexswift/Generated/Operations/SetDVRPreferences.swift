// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set DVR preferences by name and value
    public struct SetDVRPreferences: PlexOperation {
        public typealias Success = DVRResponse

        public static let operationID = "setDVRPreferences"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the DVR.
        public var dvrId: Int

        /// Set the `name` preference to the provided value
        public var name: String?

        /// Preference value to set.
        public var value: String?

        public init(
            dvrId: Int,
            name: String? = nil,
            value: String? = nil
        ) {
            self.dvrId = dvrId
            self.name = name
            self.value = value
        }

        public var path: String { "/livetv/dvrs/\(PathComponent(dvrId))/prefs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = name {
                items.append(URLQueryItem(name: "name", value: QueryValue(value).encoded))
            }
            if let value = value {
                items.append(URLQueryItem(name: "value", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
