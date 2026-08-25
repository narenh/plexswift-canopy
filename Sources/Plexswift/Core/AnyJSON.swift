import Foundation

/// A JSON value of a shape the specification does not pin down.
///
/// Plex has corners where the schema is genuinely open — server preference values differ by
/// setting, and provider payloads carry vendor extensions. Those decode to `AnyJSON` rather
/// than being flattened to `String`, so no information is lost on the way through.
///
/// ```swift
/// if let port = preferences["port"]?.intValue { ... }
/// ```
@frozen
public enum AnyJSON: Sendable, Hashable {
    case null
    case bool(Bool)
    case int(Int)
    case double(Double)
    case string(String)
    case array([AnyJSON])
    case object([String: AnyJSON])
}

// MARK: - Typed access

extension AnyJSON {
    /// The value as a `Bool`, if it is one.
    public var boolValue: Bool? {
        if case .bool(let value) = self { return value }
        return nil
    }

    /// The value as an `Int`, if it is one, or a `Double` with no fractional part.
    public var intValue: Int? {
        switch self {
        case .int(let value): return value
        case .double(let value): return value.rounded() == value ? Int(value) : nil
        default: return nil
        }
    }

    /// The value as a `Double`, widening an integer if necessary.
    public var doubleValue: Double? {
        switch self {
        case .double(let value): return value
        case .int(let value): return Double(value)
        default: return nil
        }
    }

    /// The value as a `String`, if it is one.
    public var stringValue: String? {
        if case .string(let value) = self { return value }
        return nil
    }

    /// The elements, if this is an array.
    public var arrayValue: [AnyJSON]? {
        if case .array(let value) = self { return value }
        return nil
    }

    /// The members, if this is an object.
    public var objectValue: [String: AnyJSON]? {
        if case .object(let value) = self { return value }
        return nil
    }

    /// Whether this is ``AnyJSON/null``.
    public var isNull: Bool {
        if case .null = self { return true }
        return false
    }

    /// The member named `key`, if this is an object that has one.
    public subscript(key: String) -> AnyJSON? {
        objectValue?[key]
    }

    /// The element at `index`, if this is an array long enough to have one.
    public subscript(index: Int) -> AnyJSON? {
        guard let array = arrayValue, array.indices.contains(index) else { return nil }
        return array[index]
    }
}

// MARK: - Codable

extension AnyJSON: Codable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()

        if container.decodeNil() {
            self = .null
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(Int.self) {
            // Int is attempted before Double so that whole numbers survive the round trip as
            // integers rather than becoming 1.0.
            self = .int(value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([AnyJSON].self) {
            self = .array(value)
        } else if let value = try? container.decode([String: AnyJSON].self) {
            self = .object(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Value is not valid JSON"
            )
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .null: try container.encodeNil()
        case .bool(let value): try container.encode(value)
        case .int(let value): try container.encode(value)
        case .double(let value): try container.encode(value)
        case .string(let value): try container.encode(value)
        case .array(let value): try container.encode(value)
        case .object(let value): try container.encode(value)
        }
    }
}

// MARK: - Literals

extension AnyJSON: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) { self = .null }
}

extension AnyJSON: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) { self = .bool(value) }
}

extension AnyJSON: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) { self = .int(value) }
}

extension AnyJSON: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) { self = .double(value) }
}

extension AnyJSON: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) { self = .string(value) }
}

extension AnyJSON: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: AnyJSON...) { self = .array(elements) }
}

extension AnyJSON: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, AnyJSON)...) {
        self = .object(Dictionary(elements, uniquingKeysWith: { _, new in new }))
    }
}

extension AnyJSON: CustomStringConvertible {
    public var description: String {
        switch self {
        case .null: return "null"
        case .bool(let value): return String(value)
        case .int(let value): return String(value)
        case .double(let value): return String(value)
        case .string(let value): return value
        case .array(let value): return "[\(value.map(\.description).joined(separator: ", "))]"
        case .object(let value):
            let members = value.sorted { $0.key < $1.key }
                .map { "\($0.key): \($0.value.description)" }
            return "{\(members.joined(separator: ", "))}"
        }
    }
}
