import Foundation

/// How an authentication token is carried on a request.
public enum TokenPlacement: Sendable, Hashable {
    /// Send the token as the `X-Plex-Token` header. This is the default and keeps the token out
    /// of server logs and referrer headers.
    case header
    /// Send the token as an `X-Plex-Token` query item. Plex accepts this on every endpoint, and
    /// it is the only option for URLs handed to something that cannot set headers — an
    /// `AVPlayer` asset URL, or an `<img>` tag pointed at a transcoded thumbnail.
    case queryItem
}

/// Everything a ``PlexClient`` needs in order to make a request.
public struct PlexConfiguration: Sendable {
    /// The Plex Media Server that operations without a cloud host override are sent to.
    public var server: PlexServer

    /// The `X-Plex-Token` authenticating requests.
    ///
    /// Either a traditional access token from plex.tv or a JWT obtained through the JWT
    /// authentication flow. `nil` is valid — a handful of endpoints, such as obtaining a PIN,
    /// are unauthenticated — but any operation the specification marks as requiring a token
    /// will fail with ``PlexError/missingToken(operation:)``.
    public var token: String?

    /// Where the token is placed on outgoing requests.
    public var tokenPlacement: TokenPlacement

    /// How the calling application identifies itself. Required for the OAuth PIN flow and JWT
    /// device registration; recommended for everything else.
    public var identity: ClientIdentity?

    /// Headers added to every request, applied before an operation's own headers.
    public var additionalHeaders: [String: String]

    /// The timeout applied to each request, in seconds.
    public var timeout: TimeInterval

    /// The `JSONDecoder` used to decode response bodies.
    ///
    /// Replace it to change date handling or to install a custom key strategy. The default
    /// decoder does not convert keys, because Plex's JSON already matches the property names
    /// the generated models declare.
    public var decoder: JSONDecoder

    /// The `JSONEncoder` used to encode request bodies.
    public var encoder: JSONEncoder

    /// Creates a configuration.
    ///
    /// - Parameters:
    ///   - server: The Plex Media Server to talk to.
    ///   - token: The `X-Plex-Token` to authenticate with.
    ///   - identity: How the calling application identifies itself to Plex.
    public init(
        server: PlexServer,
        token: String? = nil,
        identity: ClientIdentity? = nil,
        tokenPlacement: TokenPlacement = .header,
        additionalHeaders: [String: String] = [:],
        timeout: TimeInterval = 60,
        decoder: JSONDecoder = PlexConfiguration.makeDefaultDecoder(),
        encoder: JSONEncoder = PlexConfiguration.makeDefaultEncoder()
    ) {
        self.server = server
        self.token = token
        self.identity = identity
        self.tokenPlacement = tokenPlacement
        self.additionalHeaders = additionalHeaders
        self.timeout = timeout
        self.decoder = decoder
        self.encoder = encoder
    }

    /// The decoder used when no other is supplied.
    public static func makeDefaultDecoder() -> JSONDecoder {
        JSONDecoder()
    }

    /// The encoder used when no other is supplied.
    public static func makeDefaultEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        return encoder
    }

    /// The headers this configuration contributes to every request.
    ///
    /// Ordering matters: identity headers come first so that ``additionalHeaders`` can override
    /// them, and the token is applied last so it cannot be displaced.
    func baseHeaders() -> [String: String] {
        var headers: [String: String] = [
            "Accept": "application/json",
            "User-Agent": Plexswift.userAgent
        ]
        if let identity {
            headers.merge(identity.headers) { _, new in new }
        }
        headers.merge(additionalHeaders) { _, new in new }
        if case .header = tokenPlacement, let token {
            headers["X-Plex-Token"] = token
        }
        return headers
    }
}
