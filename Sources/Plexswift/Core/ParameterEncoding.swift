import Foundation

/// A parameter value rendered the way Plex expects it on the wire.
///
/// The overloads exist so that generated code can write `QueryValue(value)` for a parameter of
/// any type without the generator having to know how each one is spelled. Booleans are the
/// case that matters: Plex reads `1` and `0`, and treats the string `false` as a value that is
/// present and therefore true.
public struct QueryValue: Sendable, Hashable {
    /// The rendered value.
    public let encoded: String

    public init(_ value: String) {
        encoded = value
    }

    public init(_ value: Int) {
        encoded = String(value)
    }

    public init(_ value: Bool) {
        encoded = value ? "1" : "0"
    }

    public init(_ value: Double) {
        // A whole number renders without a fractional part, so an offset of 1 is sent as "1"
        // rather than "1.0" — some Plex endpoints reject the latter.
        encoded = value.rounded() == value && value.magnitude < 1e15
            ? String(Int(value))
            : String(value)
    }

    public init<Value: RawRepresentable>(_ value: Value) where Value.RawValue == String {
        encoded = value.rawValue
    }

    public init<Value: RawRepresentable>(_ value: Value) where Value.RawValue == Int {
        encoded = String(value.rawValue)
    }

    public init(_ value: AnyJSON) {
        encoded = value.description
    }

    public init(_ value: Data) {
        encoded = value.base64EncodedString()
    }
}

/// Encoding for query parameters whose value is an object rather than a scalar.
///
/// OpenAPI calls this the `deepObject` style: each member of the object becomes its own query
/// item, with the member name in brackets — `mediaQuery[type]=1&mediaQuery[year]=2020`. The
/// Plex filtering parameters are the only ones that use it.
public enum DeepObjectQuery {
    /// The query items representing `value` under `name`.
    ///
    /// Members whose value is null are omitted, matching how an absent filter behaves. Nested
    /// objects and arrays are flattened with further bracketed keys.
    public static func items(
        name: String,
        value: some Encodable,
        encoder: JSONEncoder = JSONEncoder()
    ) throws -> [URLQueryItem] {
        let json = try JSONDecoder().decode(AnyJSON.self, from: try encoder.encode(value))
        return items(name: name, json: json)
    }

    static func items(name: String, json: AnyJSON) -> [URLQueryItem] {
        switch json {
        case .null:
            return []
        case .object(let members):
            return members
                .sorted { $0.key < $1.key }
                .flatMap { key, member in items(name: "\(name)[\(key)]", json: member) }
        case .array(let elements):
            return elements.flatMap { items(name: name, json: $0) }
        case .bool(let value):
            return [URLQueryItem(name: name, value: QueryValue(value).encoded)]
        case .int(let value):
            return [URLQueryItem(name: name, value: QueryValue(value).encoded)]
        case .double(let value):
            return [URLQueryItem(name: name, value: QueryValue(value).encoded)]
        case .string(let value):
            return [URLQueryItem(name: name, value: value)]
        }
    }
}

/// A value substituted into a request path.
///
/// Percent-encoding here is what keeps a path parameter from changing which endpoint is
/// called: a rating key or section title containing `/`, `?` or `#` would otherwise be
/// interpolated raw and silently rewrite the URL.
public struct PathComponent: CustomStringConvertible, Sendable, Hashable {
    public let description: String

    private init(encoding value: String) {
        description = value.addingPercentEncoding(
            withAllowedCharacters: Self.allowed
        ) ?? value
    }

    public init(_ value: String) { self.init(encoding: QueryValue(value).encoded) }
    public init(_ value: Int) { self.init(encoding: QueryValue(value).encoded) }
    public init(_ value: Bool) { self.init(encoding: QueryValue(value).encoded) }
    public init(_ value: Double) { self.init(encoding: QueryValue(value).encoded) }
    public init(_ value: AnyJSON) { self.init(encoding: QueryValue(value).encoded) }

    public init<Value: RawRepresentable>(_ value: Value) where Value.RawValue == String {
        self.init(encoding: QueryValue(value).encoded)
    }

    public init<Value: RawRepresentable>(_ value: Value) where Value.RawValue == Int {
        self.init(encoding: QueryValue(value).encoded)
    }

    /// The characters legal inside a single path component.
    ///
    /// Narrower than `urlPathAllowed`, which permits several characters that carry structural
    /// meaning at this position:
    ///
    /// - `/` would let a value introduce extra path segments, changing which endpoint is called.
    /// - `,` separates the elements of a list-valued path parameter, so a comma inside one
    ///   element would forge a separator and split it in two.
    /// - `;` introduces a matrix parameter.
    private static let allowed: CharacterSet = {
        var allowed = CharacterSet.urlPathAllowed
        allowed.remove(charactersIn: "/,;")
        return allowed
    }()
}
