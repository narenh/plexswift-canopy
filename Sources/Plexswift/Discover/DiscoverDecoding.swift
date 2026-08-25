import Foundation

// The Discover and metadata providers are not described by the vendored specification, and
// their payloads are looser than the media server's: a field that is a number on one item is a
// quoted number on the next, an array of one is sometimes the bare object, and new keys appear
// without notice. Nothing here is a schema — it is a set of decoding helpers that read what is
// there and leave the rest nil, so that one odd value cannot fail a whole request.
//
// Every helper is non-throwing on purpose. A `Discover` model's `init(from:)` therefore never
// throws either, which is what makes a partial response usable rather than an error.

extension KeyedDecodingContainer {

    /// The raw JSON value for `key`, or nil if it is absent or null.
    func discoverValue(_ key: Key) -> AnyJSON? {
        guard let value = try? decodeIfPresent(AnyJSON.self, forKey: key), !value.isNull else {
            return nil
        }
        return value
    }

    /// An integer, accepting the quoted and floating-point spellings Plex also uses.
    func discoverInt(_ key: Key) -> Int? {
        guard let value = discoverValue(key) else { return nil }
        if let int = value.intValue { return int }
        if let string = value.stringValue {
            return Int(string) ?? Double(string).flatMap { $0.rounded() == $0 ? Int($0) : nil }
        }
        if let bool = value.boolValue { return bool ? 1 : 0 }
        return nil
    }

    /// A floating-point number, accepting the quoted spelling.
    func discoverDouble(_ key: Key) -> Double? {
        guard let value = discoverValue(key) else { return nil }
        if let double = value.doubleValue { return double }
        if let string = value.stringValue { return Double(string) }
        return nil
    }

    /// A boolean. Plex writes these as `1`/`0` at least as often as `true`/`false`, and
    /// occasionally as the strings `"1"` or `"true"`.
    func discoverBool(_ key: Key) -> Bool? {
        guard let value = discoverValue(key) else { return nil }
        if let bool = value.boolValue { return bool }
        if let int = value.intValue { return int != 0 }
        if let string = value.stringValue {
            switch string.lowercased() {
            case "1", "true", "yes": return true
            case "0", "false", "no": return false
            default: return nil
            }
        }
        return nil
    }

    /// A string, widening a number to its decimal spelling.
    ///
    /// Identifiers are the reason: a `ratingKey` arrives quoted from one endpoint and bare from
    /// another, and a client that switched type with the endpoint would be unusable.
    func discoverString(_ key: Key) -> String? {
        guard let value = discoverValue(key) else { return nil }
        switch value {
        case .string(let string): return string
        case .int(let int): return String(int)
        case .double(let double): return QueryValue(double).encoded
        case .bool(let bool): return bool ? "1" : "0"
        case .null, .array, .object: return nil
        }
    }

    /// A nested object, or nil if it is missing or does not decode.
    func discoverObject<Value: Decodable>(_ type: Value.Type, _ key: Key) -> Value? {
        try? decodeIfPresent(Value.self, forKey: key)
    }

    /// A nested array, skipping any element that fails to decode.
    ///
    /// A single object is accepted where an array is expected. Plex's JSON is derived from its
    /// XML, and a collection with one member is sometimes written as that member alone.
    func discoverList<Element: Decodable>(_ type: Element.Type, _ key: Key) -> [Element]? {
        if let elements = try? decodeIfPresent([LenientElement<Element>].self, forKey: key) {
            return elements.compactMap(\.value)
        }
        if let single = try? decodeIfPresent(Element.self, forKey: key) {
            return [single]
        }
        return nil
    }
}

/// An array element that decodes to nil rather than failing.
///
/// Decoding an array element by element with `try?` inside an unkeyed container does not work:
/// a throwing `decode` leaves the container's index where it was, so the same bad element is
/// read forever. Wrapping the element moves the failure inside a `decode` that always succeeds,
/// which advances the index exactly once.
struct LenientElement<Wrapped: Decodable>: Decodable {
    let value: Wrapped?

    init(from decoder: any Decoder) throws {
        value = try? Wrapped(from: decoder)
    }
}
