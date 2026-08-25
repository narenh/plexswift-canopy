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
        let (data, response) = try await session.plexData(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        return (data, httpResponse)
    }
}

extension URLSession {
    /// `data(for:)`, with a fallback for platforms whose Foundation lacks the async overload.
    ///
    /// swift-corelibs-foundation gained `data(for:)` in Swift 5.7, and the Darwin overload is
    /// gated on iOS 15 / macOS 12. Below either bar the request is bridged from the completion
    /// handler API, cancelling the underlying task if the surrounding `Task` is cancelled.
    func plexData(for request: URLRequest) async throws -> (Data, URLResponse) {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            return try await data(for: request)
        }
        let box = CancellationBox()
        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                let task = dataTask(with: request) { data, response, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else if let data, let response {
                        continuation.resume(returning: (data, response))
                    } else {
                        continuation.resume(throwing: URLError(.badServerResponse))
                    }
                }
                box.adopt(task)
                task.resume()
            }
        } onCancel: {
            box.cancel()
        }
    }

    /// Holds the single `URLSessionTask` backing one bridged request.
    ///
    /// Cancellation can arrive before the task has been created, so the box records that it was
    /// cancelled and cancels the task as soon as it is adopted.
    private final class CancellationBox: @unchecked Sendable {
        private let lock = NSLock()
        private var task: URLSessionTask?
        private var isCancelled = false

        func adopt(_ task: URLSessionTask) {
            lock.lock()
            let shouldCancel = isCancelled
            self.task = task
            lock.unlock()
            if shouldCancel { task.cancel() }
        }

        func cancel() {
            lock.lock()
            isCancelled = true
            let task = self.task
            lock.unlock()
            task?.cancel()
        }
    }
}
