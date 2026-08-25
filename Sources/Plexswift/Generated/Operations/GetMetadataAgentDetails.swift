// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get details and settings for a specific metadata agent.
    public struct GetMetadataAgentDetails: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "getMetadataAgentDetails"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the metadata agent
        public var agentId: String

        public init(
            agentId: String
        ) {
            self.agentId = agentId
        }

        public var path: String { "/system/agents/\(PathComponent(agentId))" }
    }
}
