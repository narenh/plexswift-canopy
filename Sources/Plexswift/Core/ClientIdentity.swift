import Foundation

/// Identifies the calling application to Plex.
///
/// Plex expects every client to describe itself through a family of `X-Plex-*` headers. They
/// are what makes a device show up under *Settings → Authorized Devices*, and
/// `X-Plex-Client-Identifier` in particular is mandatory for the OAuth PIN flow and for JWT
/// device registration — those endpoints reject requests without it.
///
/// The identifier must be **stable across launches** for the same installation. Generating a
/// fresh UUID each time the app starts registers a new device with Plex on every launch and
/// invalidates previously issued tokens, so persist it (in the keychain, or
/// `UserDefaults` at a minimum) and pass the stored value back in.
public struct ClientIdentity: Sendable, Hashable {
    /// A stable, opaque identifier unique to this installation. Sent as `X-Plex-Client-Identifier`.
    public var clientIdentifier: String
    /// The name of the application, for example `My Plex Client`. Sent as `X-Plex-Product`.
    public var product: String
    /// The version of the application. Sent as `X-Plex-Version`.
    public var version: String
    /// A human-readable name for the device, shown in Plex's device list. Sent as `X-Plex-Device-Name`.
    public var deviceName: String?
    /// The device model or type, for example `iPhone`. Sent as `X-Plex-Device`.
    public var device: String?
    /// The operating system, for example `iOS`. Sent as `X-Plex-Platform`.
    public var platform: String?
    /// The operating system version. Sent as `X-Plex-Platform-Version`.
    public var platformVersion: String?
    /// A less friendly identifier for the device model. Sent as `X-Plex-Model`.
    public var model: String?
    /// The vendor of the device. Sent as `X-Plex-Device-Vendor`.
    public var deviceVendor: String?
    /// The marketplace the application is distributed on, for example `apple`.
    /// Sent as `X-Plex-Marketplace`.
    public var marketplace: String?

    /// Creates an identity for the calling application.
    ///
    /// - Parameters:
    ///   - clientIdentifier: A stable identifier for this installation. See the note on
    ///     ``ClientIdentity`` about persisting it rather than generating one per launch.
    ///   - product: The name of the application.
    ///   - version: The version of the application.
    ///   - deviceName: A human-readable name for the device, shown in Plex's device list.
    ///   - device: The device model or type, for example `iPhone`.
    ///   - platform: The operating system, for example `iOS`.
    ///   - platformVersion: The operating system version.
    ///   - model: A less friendly identifier for the device model.
    ///   - deviceVendor: The vendor of the device.
    ///   - marketplace: The marketplace the application is distributed on.
    public init(
        clientIdentifier: String,
        product: String = Plexswift.defaultProduct,
        version: String = Plexswift.version,
        deviceName: String? = nil,
        device: String? = nil,
        platform: String? = nil,
        platformVersion: String? = nil,
        model: String? = nil,
        deviceVendor: String? = nil,
        marketplace: String? = nil
    ) {
        self.clientIdentifier = clientIdentifier
        self.product = product
        self.version = version
        self.deviceName = deviceName
        self.device = device
        self.platform = platform
        self.platformVersion = platformVersion
        self.model = model
        self.deviceVendor = deviceVendor
        self.marketplace = marketplace
    }

    /// The `X-Plex-*` headers describing this identity.
    public var headers: [String: String] {
        var headers = [
            "X-Plex-Client-Identifier": clientIdentifier,
            "X-Plex-Product": product,
            "X-Plex-Version": version
        ]
        headers["X-Plex-Device-Name"] = deviceName
        headers["X-Plex-Device"] = device
        headers["X-Plex-Platform"] = platform
        headers["X-Plex-Platform-Version"] = platformVersion
        headers["X-Plex-Model"] = model
        headers["X-Plex-Device-Vendor"] = deviceVendor
        headers["X-Plex-Marketplace"] = marketplace
        return headers
    }
}
