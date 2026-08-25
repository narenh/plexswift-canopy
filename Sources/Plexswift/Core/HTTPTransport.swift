import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Performs HTTP requests on behalf of a ``PlexClient``.
///
/// Injecting a transport is how the SDK is tested without a network, and how a host application
/// installs its own retry, logging, or offline-cache behaviour around requests.
public protocol HTTPTransport: Sendable {
    /// Sends `request` and returns the response together with its body.
    ///
    /// - Throws: Any error that prevented an HTTP response from arriving. ``PlexClient`` wraps
    ///   whatever is thrown here in ``PlexError/transport(_:)``, so implementations should not
    ///   translate errors themselves.
    func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

/// The default transport, backed by `URLSession`.
public struct URLSessionTransport: HTTPTransport {
    private let session: URLSession

    /// Creates a transport using `session`.
    ///
    /// - Parameter session: The session to send requests on. Pass a session configured with
    ///   your own cache, proxy, or certificate-pinning delegate to have the SDK use it.
    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        // `data(for:)` is available unconditionally at this package's deployment targets, and
        // cancels its underlying task when the surrounding Task is cancelled.
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        return (data, httpResponse)
    }
}
