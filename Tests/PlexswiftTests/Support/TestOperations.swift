import Foundation
@testable import Plexswift

/// A minimal operation used to exercise request construction and response handling without
/// depending on any particular generated operation.
struct ProbeOperation: PlexOperation {
    struct Payload: Codable, Sendable, Hashable {
        let name: String
        let size: Int
    }

    typealias Success = Payload

    static let operationID = "probe"
    static let method = HTTPMethod.get

    var path: String = "/probe"
    var queryItems: [URLQueryItem] = []
    var headers: [String: String] = [:]
}

/// An operation addressed to plex.tv rather than the user's media server.
struct CloudProbeOperation: PlexOperation {
    typealias Success = EmptyResponse

    static let operationID = "cloudProbe"
    static let method = HTTPMethod.get
    static let host = OperationHost.plexTVv2

    var path: String = "/user"
}

/// An operation that requires no token, as the PIN endpoints do.
struct UnauthenticatedProbeOperation: PlexOperation {
    typealias Success = EmptyResponse

    static let operationID = "unauthenticatedProbe"
    static let method = HTTPMethod.post
    static let host = OperationHost.plexTVv2
    static let requiresToken = false
    static let requiresClientIdentifier = true

    var path: String = "/pins"
}

/// An operation with a JSON request body.
struct WriteProbeOperation: PlexOperation {
    struct Body: Codable, Sendable {
        let title: String
    }

    typealias Success = EmptyResponse

    static let operationID = "writeProbe"
    static let method = HTTPMethod.post

    var path: String = "/write"
    var payload: Body

    func body(encoder: JSONEncoder) throws -> RequestBody? {
        try .json(payload, encoder: encoder)
    }
}

/// An operation returning raw bytes, as the image endpoints do.
struct BinaryProbeOperation: PlexOperation {
    typealias Success = Data

    static let operationID = "binaryProbe"
    static let method = HTTPMethod.get

    var path: String = "/photo/:/transcode"
}

/// An operation whose successful response is text rather than JSON, as the legacy plex.tv XML
/// endpoints are.
struct TextProbeOperation: PlexOperation {
    typealias Success = String

    static let operationID = "textProbe"
    static let method = HTTPMethod.get

    var path: String = "/api/resources"
}
