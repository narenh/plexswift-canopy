# ``Plexswift``

A Swift client for the Plex Media Server and plex.tv APIs.

## Overview

The package covers 405 operations across 33 namespaces, generated from version 1.1.1 of the
[Plex OpenAPI specification](https://github.com/LukeHagar/plex-api-spec).

Start by building a ``PlexClient``. It needs an address and, for almost everything, a token and
a ``ClientIdentity``:

```swift
let client = PlexClient(
    server: .host(scheme: .http, host: "192.168.1.10", port: 32400),
    token: storedToken,
    identity: ClientIdentity(
        clientIdentifier: storedClientIdentifier,
        product: "My Plex App"
    )
)

let container = try await client.library.getLibrarySectionsFallback()
```

### Three things worth knowing first

**The server address is required.** There is no implicit default, and every ``PlexServer`` case
resolves to a real URL — including `plex.direct`, which is how Plex serves a valid TLS
certificate for what is otherwise a bare IP address.

**The client identity is required in practice.** The specification marks
`X-Plex-Client-Identifier` required on 366 of the 405 operations. It must be stable across
launches: a fresh identifier registers a new device with Plex each time and invalidates tokens
already issued. Calling an operation that needs one without it fails locally with
``PlexError/missingClientIdentifier(operation:)`` rather than as a puzzling server error.

**Failures throw.** Operations return the decoded response body; a non-2xx status raises
``PlexError/api(_:)``. Because every throwing method is declared `throws(PlexError)`, a `catch`
over ``PlexError``'s cases is exhaustive.

```swift
do {
    let container = try await client.library.getLibrarySectionsFallback()
} catch let PlexError.api(error) where error.isAuthenticationFailure {
    // 401 or 403
} catch let PlexError.api(error) where error.isRetryable {
    // 429 or 5xx
}
```

### Response fields are optional

Every generated model property is optional, including those the specification marks required.
The specification contradicts itself — decoding the example payloads it publishes against its
own `required` lists fails for 13 schemas — and a real server omits fields depending on library
type, agent and version. A non-optional property would turn any such omission into a thrown
error that fails the whole request.

### Plex Discover is here too, on different terms

The endpoints behind Plex Discover — catalogue search, the home-screen hubs, the watchlist,
and streaming availability — are not in the specification, so they are not generated. They are
hand-written under ``PlexClient/discover``, and their models decode leniently because an
undocumented API can change under a shipped app. See <doc:PlexDiscover>.

### Going lower level

An operation is an inert value describing a request, not something that performs one. Construct
one directly and hand it to ``PlexClient/send(_:)`` when you need the status code or headers, or
to ``PlexClient/makeRequest(for:)`` to get a `URLRequest` you can pass to something outside the
SDK — an `AVPlayer` asset URL, or an image loader.

``HTTPTransport`` is the injection point for tests, retries and logging.

## Topics

### Essentials

- ``PlexClient``
- ``PlexConfiguration``
- ``PlexServer``
- ``ClientIdentity``

### Plex Discover

- <doc:PlexDiscover>
- ``DiscoverAPI``
- ``DiscoverMetadata``
- ``DiscoverMetadataInclusions``

### Results and failures

- ``PlexResponse``
- ``HTTPHeaders``
- ``PlexError``
- ``ResponseDecodingError``

### Describing a request

- ``PlexOperation``
- ``Operations``
- ``OperationHost``
- ``HTTPMethod``
- ``RequestBody``
- ``EmptyResponse``

### Sending a request

- ``HTTPTransport``
- ``URLSessionTransport``

### Encoding values

- ``QueryValue``
- ``PathComponent``
- ``DeepObjectQuery``
- ``TokenPlacement``
- ``AnyJSON``

### Package metadata

- ``Plexswift``
