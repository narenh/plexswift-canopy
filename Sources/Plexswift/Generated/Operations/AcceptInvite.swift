// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Accept a pending Plex friend, home, or server invitation.
    public struct AcceptInvite: PlexOperation {
        public typealias Success = EmptyResponse

        public static let operationID = "acceptInvite"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.plexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The pending invitation ID.
        public var inviteId: Int

        /// Whether the invitation includes a friend relationship.
        public var friend: BoolInt

        /// Whether the invitation includes Plex Home membership.
        public var home: BoolInt

        /// Whether the invitation includes access to a shared server.
        public var server: BoolInt

        public init(
            inviteId: Int,
            friend: BoolInt,
            home: BoolInt,
            server: BoolInt
        ) {
            self.inviteId = inviteId
            self.friend = friend
            self.home = home
            self.server = server
        }

        public var path: String { "/api/invites/requests/\(PathComponent(inviteId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = friend
                items.append(URLQueryItem(name: "friend", value: QueryValue(value).encoded))
            }
            do {
                let value = home
                items.append(URLQueryItem(name: "home", value: QueryValue(value).encoded))
            }
            do {
                let value = server
                items.append(URLQueryItem(name: "server", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
