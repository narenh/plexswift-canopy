// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a media part for streaming or download.
    /// - streaming: This is the default scenario.  Bandwidth usage on this endpoint will be guaranteed (on the server's end) to be at least the bandwidth reservation given in the decision.  If no decision exists, an ad-hoc decision will be created if sufficient bandwidth exists.  Clients should not rely on ad-hoc decisions being made as this may be removed in the future.
    /// - download: Indicated if the query parameter indicates this is a download.  Bandwidth will be prioritized behind playbacks and will get a fair share of what remains.
    public struct GetMediaPart: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getMediaPart"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The part id who's index is to be fetched
        public var partId: Int

        /// The changestamp of the part; used for busting potential caches. Provided in the `key` for the
        /// part
        public var changestamp: Int

        /// A generic filename used for a client media stack which relies on the extension in the request.
        /// Provided in the `key` for the part
        public var filename: String

        /// Whether this is a file download
        public var download: BoolInt?

        public init(
            partId: Int,
            changestamp: Int,
            filename: String,
            download: BoolInt? = nil
        ) {
            self.partId = partId
            self.changestamp = changestamp
            self.filename = filename
            self.download = download
        }

        public var path: String { "/library/parts/\(PathComponent(partId))/\(PathComponent(changestamp))/\(PathComponent(filename))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = download {
                items.append(URLQueryItem(name: "download", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
