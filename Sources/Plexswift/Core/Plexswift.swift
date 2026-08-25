import Foundation

/// Metadata describing this build of the SDK.
public enum Plexswift {
    /// The version of this package.
    public static let version = "1.0.0-alpha.1"

    /// The version of the Plex OpenAPI specification the generated sources were produced from.
    ///
    /// The specification itself is vendored at `Spec/plex-api-spec.yaml`.
    public static let specVersion = "1.1.1"

    /// The value sent as the `X-Plex-Product` header when a ``ClientIdentity`` does not override it.
    public static let defaultProduct = "Plexswift"

    /// The default `User-Agent` for requests made by this SDK.
    public static var userAgent: String { "Plexswift/\(version) (Swift)" }
}
