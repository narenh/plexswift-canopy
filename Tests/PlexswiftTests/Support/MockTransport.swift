import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
@testable import Plexswift

/// A transport that answers from a canned script instead of the network, and records every
/// request it was handed.
final class MockTransport: HTTPTransport, @unchecked Sendable {
    /// What a `MockTransport` should do with the next request.
    enum Outcome {
        case success(statusCode: Int, headers: [String: String], body: Data)
        case failure(any Error)
    }

    private let lock = NSLock()
    private var outcomes: [Outcome]
    private var recorded: [URLRequest] = []

    init(_ outcomes: [Outcome]) {
        self.outcomes = outcomes
    }

    /// A transport that answers every request with `json` and a 200.
    convenience init(json: String, statusCode: Int = 200) {
        self.init([
            .success(
                statusCode: statusCode,
                headers: ["Content-Type": "application/json"],
                body: Data(json.utf8)
            )
        ])
    }

    /// A transport that answers with an error status and a text body, as Plex does.
    convenience init(errorStatus: Int, body: String = "Unauthorized") {
        self.init([
            .success(
                statusCode: errorStatus,
                headers: ["Content-Type": "text/html"],
                body: Data(body.utf8)
            )
        ])
    }

    /// The requests this transport has been asked to send, in order.
    var requests: [URLRequest] {
        lock.lock()
        defer { lock.unlock() }
        return recorded
    }

    /// The single request this transport was handed.
    var lastRequest: URLRequest? { requests.last }

    func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        lock.lock()
        recorded.append(request)
        let outcome = outcomes.isEmpty ? nil : outcomes.removeFirst()
        lock.unlock()

        guard let outcome else {
            throw MockTransportError.noOutcomeScripted(request.url?.absoluteString ?? "<no url>")
        }

        switch outcome {
        case .failure(let error):
            throw error
        case .success(let statusCode, let headers, let body):
            guard let url = request.url,
                  let response = HTTPURLResponse(
                    url: url,
                    statusCode: statusCode,
                    httpVersion: "HTTP/1.1",
                    headerFields: headers
                  )
            else {
                throw MockTransportError.couldNotBuildResponse
            }
            return (body, response)
        }
    }
}

enum MockTransportError: Error {
    case noOutcomeScripted(String)
    case couldNotBuildResponse
}

// MARK: - Test helpers

extension URLRequest {
    /// The request's query items, keyed by name.
    var queryItemsByName: [String: String] {
        guard let url,
              let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems
        else { return [:] }
        return Dictionary(
            items.compactMap { item in item.value.map { (item.name, $0) } },
            uniquingKeysWith: { _, new in new }
        )
    }
}
