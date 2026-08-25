// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Create a subscription. The query parameters should be mostly derived from the
    /// [template](#tag/Subscriptions/operation/mediaSubscriptionsGetTemplate)
    public struct CreateSubscription: PlexOperation {
        public typealias Success = CreateSubscriptionResponse

        public static let operationID = "createSubscription"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The library section into which we'll grab the media. Not actually required when the subscription
        /// is to a playlist.
        public var targetLibrarySectionID: Int?

        /// The section location into which to grab.
        public var targetSectionLocationID: Int?

        /// The type of the thing we're subscribing too (e.g. show, season).
        public var type: Int?

        /// Hints describing what we're looking for. Note: The hint `ratingKey` is required for downloading
        /// from a PMS remote.
        public var hints: AnyJSON?

        /// Subscription preferences.
        public var prefs: AnyJSON?

        /// Subscription parameters.
        /// - `mediaProviderID`: Required for downloads to indicate which MP the subscription will download into
        /// - `source`: Required for downloads to indicate the source of the downloaded content.
        public var params: AnyJSON?

        public init(
            targetLibrarySectionID: Int? = nil,
            targetSectionLocationID: Int? = nil,
            type: Int? = nil,
            hints: AnyJSON? = nil,
            prefs: AnyJSON? = nil,
            params: AnyJSON? = nil
        ) {
            self.targetLibrarySectionID = targetLibrarySectionID
            self.targetSectionLocationID = targetSectionLocationID
            self.type = type
            self.hints = hints
            self.prefs = prefs
            self.params = params
        }

        public var path: String { "/media/subscriptions" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = targetLibrarySectionID {
                items.append(URLQueryItem(name: "targetLibrarySectionID", value: QueryValue(value).encoded))
            }
            if let value = targetSectionLocationID {
                items.append(URLQueryItem(name: "targetSectionLocationID", value: QueryValue(value).encoded))
            }
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            if let value = hints {
                items.append(URLQueryItem(name: "hints", value: QueryValue(value).encoded))
            }
            if let value = prefs {
                items.append(URLQueryItem(name: "prefs", value: QueryValue(value).encoded))
            }
            if let value = params {
                items.append(URLQueryItem(name: "params", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
