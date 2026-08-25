// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get details for a single actor.
    public struct GetPerson: PlexOperation {
        public typealias Success = MediaContainerWithTags

        public static let operationID = "getPerson"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Either the PMS tag `id` of the person or `tagKey` of the actor. Note the `tagKey` is the hex
        /// portion of the plex guid for the actor
        public var personId: String

        public init(
            personId: String
        ) {
            self.personId = personId
        }

        public var path: String { "/library/people/\(PathComponent(personId))" }
    }
}
