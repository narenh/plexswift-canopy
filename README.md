# plexswift

A Swift client for the [Plex Media Server and plex.tv APIs](https://plexapi.dev), generated
from the [Plex OpenAPI specification](https://github.com/LukeHagar/plex-api-spec).

![Platforms](https://img.shields.io/badge/Platforms-iOS%2018%20%7C%20macOS%2015%20%7C%20tvOS%2018%20%7C%20watchOS%2011%20%7C%20visionOS%202%20%7C%20Linux-lightgray)
![Swift](https://img.shields.io/badge/Swift-6.0%2B-orange.svg)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE.md)

**405 operations across 33 namespaces, generated from specification 1.1.1.**

---

## About this fork

This is a fork of [`LukeHagar/plexswift`](https://github.com/LukeHagar/plexswift), which was
archived in 2024. It has been rebuilt rather than patched, for two reasons.

**The archived package did not compile.** A clean checkout of its `main` fails with 1,801
errors under Swift 6.2. Its last generation run emitted a `PlexswiftAPI` protocol referencing
request and response types it never wrote — `GetLibraries`, `GetMetadata`, `GetToken` and four
others — along with entirely missing types including `UsersAPI`, `WatchlistAPI` and three
server enums. No published release of it could have built.

**It also could not have made a request.** The client held a private `_selectedServer` that
nothing ever assigned and no API exposed, so every call fell back to a default that returned
the specification's server *template* — the literal string `{protocol}://{ip}:{port}` — without
substituting its variables. `URL(string:)` rejects that. The single configured server value
also hardcoded a private address, `10.10.10.47`, as its default IP.

Regenerating in place was not an option: the Speakeasy CLI requires an interactive browser
login against the original author's account, and the nightly workflow in the repository would
have overwritten any local work with output this fork cannot reproduce. So this fork owns its
generation. The specification is vendored at [`Spec/`](Spec/), the generator lives in
[`Tools/`](Tools/), and CI fails if the two drift apart.

If you are migrating from the original package, see
[Migrating from plexswift 0.10](#migrating-from-plexswift-010).

## Requirements

Swift 6.0 or later. iOS 18+, macOS 15+, tvOS 18+, watchOS 11+, visionOS 2+, and Linux.

The package builds in **Swift 6 language mode** with full strict concurrency, and the whole
public surface is `Sendable`.

Raising the floor from the original package's iOS 13 removed the availability-gated fallbacks
it needed — `URLSession.data(for:)` is now used directly rather than bridged from the
completion-handler API through a continuation — and allows **typed throws**: every method that
can fail is declared `throws(PlexError)`, so `catch` is exhaustive and callers never have to
handle an error the SDK cannot produce.

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/narenh/plexswift-canopy.git", branch: "main")
]
```

## Getting started

A client needs an address. There is no implicit default, and every `PlexServer` case resolves
to a real URL.

```swift
import Plexswift

let client = PlexClient(
    server: .host(scheme: .http, host: "192.168.1.10", port: 32400),
    token: storedToken,
    identity: ClientIdentity(
        clientIdentifier: storedClientIdentifier,   // stable across launches — see below
        product: "My Plex App",
        version: "1.0.0"
    )
)

let container = try await client.library.getLibrarySectionsFallback()
for directory in container.mediaContainer?.directory ?? [] {
    print(directory.title ?? "Untitled", directory.type ?? "")
}
```

### Addressing a server

```swift
.host(scheme: .https, host: "plex.example.com", port: 32400)   // LAN or reverse proxy
.plexDirect(ip: "10.0.0.5", identifier: machineIdentifier)      // valid TLS for a bare IP
.url(URL(string: "http://localhost:32400")!)                    // anything else
.localhost                                                       // http://localhost:32400
```

`plexDirect` converts the address to the hyphenated form the certificates require, so
`10.0.0.5` becomes `https://10-0-0-5.<identifier>.plex.direct:32400`.

### Identifying your app

Plex expects every client to describe itself through `X-Plex-*` headers. They are what makes
your app appear under **Settings → Authorized Devices**.

`X-Plex-Client-Identifier` is not optional in practice: the specification marks it required on
**366 of the 405 operations**, including most of the library and playback surface. Treat
`identity` as a required argument to `PlexClient` — the parameter defaults to `nil` only
because a handful of endpoints genuinely do not need it.

The identifier must be **stable across launches**. Generating a fresh UUID each time registers
a new device on every launch and invalidates previously issued tokens, so persist it and pass
the stored value back in. On iOS, macOS, watchOS and visionOS the keychain is the right place.
On tvOS it is not — see below.

Calling an operation that needs an identity without one fails locally, with
`PlexError.missingClientIdentifier`, rather than as a confusing error from the server.

> [!IMPORTANT]
> **tvOS: persisting the client identifier needs care.**
>
> Every API in this package works on tvOS — nothing in the SDK is gated by platform. The
> caveat is about *your* storage, not about this package.
>
> tvOS deliberately provides almost no durable local storage. `UserDefaults` is capped at
> around 500 KB and the system may purge it, and there is no guarantee that locally stored
> data — keychain items included — survives. Apple's guidance is to keep anything that must
> persist in [iCloud key-value storage](https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore)
> (`NSUbiquitousKeyValueStore`, 1 MB total, 64-byte keys), which comfortably fits a UUID and
> a token.
>
> This matters here because a lost `clientIdentifier` is not a cache miss: the next launch
> registers as a *new device* with Plex, and the user has to authorise it through the PIN
> flow again. On tvOS, store the identifier in `NSUbiquitousKeyValueStore` with a
> `UserDefaults` fallback for when iCloud is unavailable, rather than in the keychain.
>
> Nothing else in the SDK is affected — `URLSession`, `Codable` and all 405 operations behave
> identically on tvOS.

### Signing in with the OAuth PIN flow

```swift
let identity = ClientIdentity(clientIdentifier: storedClientIdentifier, product: "My Plex App")
let anonymous = PlexClient(server: .localhost, identity: identity)

let pin = try await anonymous.authentication.createOAuthPin()
// Send the user to https://plex.tv/link and have them enter pin.code

// Poll until the user finishes, then keep the token.
let checked = try await anonymous.authentication.getOAuthPin(pinId: pin.id!)
guard let token = checked.authToken else { /* not linked yet */ return }

let client = anonymous.with(token: token)
```

### Errors

Operations return the decoded response body and throw for everything else, so a non-2xx status
is an error rather than a case to handle on every call.

```swift
do {
    let container = try await client.library.getLibrarySectionsFallback()
} catch let PlexError.api(error) where error.isAuthenticationFailure {
    // 401 or 403 — token missing, invalid, or expired
} catch let PlexError.api(error) where error.isRetryable {
    // 429 or 5xx — worth trying again
} catch let PlexError.api(error) {
    print(error.statusCode, error.bodyText ?? "")
} catch let PlexError.transport(underlying) {
    // No HTTP response at all — offline, DNS, TLS, timeout
}
```

Any URL attached to a response or an error has its `X-Plex-Token` replaced with `REDACTED`, so
logging one does not leak the token.

### Response metadata

The namespace methods return the decoded body. When you also need the status code or headers,
send the operation directly:

```swift
let response = try await client.send(Operations.GetServerInfo())
print(response.statusCode, response.headers["X-Plex-Protocol"] ?? "")
```

Operations are inert values describing a request, so you can also build a `URLRequest` without
sending it — useful for handing an authenticated URL to `AVPlayer` or an image loader:

```swift
var configuration = client.configuration
configuration.tokenPlacement = .queryItem      // AVPlayer cannot set headers
let request = try PlexClient(configuration: configuration)
    .makeRequest(for: Operations.TranscodeImage(/* … */))
let asset = AVURLAsset(url: request.url!)
```

### Testing against the client

`HTTPTransport` is the seam. Substitute one to answer from fixtures, or to wrap requests in
your own retry or logging:

```swift
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking   // URLRequest and HTTPURLResponse live here on Linux
#endif

struct StubTransport: HTTPTransport {
    func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) { /* … */ }
}

let client = PlexClient(server: .localhost, token: "test", transport: StubTransport())
```

## Namespaces

| Namespace | Operations | | Namespace | Operations |
| --- | --: | --- | --- | --: |
| `client.activities` | 2 | | `client.playQueue` | 9 |
| `client.authentication` | 17 | | `client.playback` | 26 |
| `client.butler` | 5 | | `client.playlist` | 3 |
| `client.collections` | 1 | | `client.playlists` | 1 |
| `client.content` | 13 | | `client.plex` | 1 |
| `client.devices` | 13 | | `client.preferences` | 3 |
| `client.downloadQueue` | 9 | | `client.provider` | 8 |
| `client.dvrs` | 16 | | `client.rate` | 1 |
| `client.epg` | 11 | | `client.search` | 2 |
| `client.events` | 3 | | `client.status` | 6 |
| `client.general` | 36 | | `client.subscriptions` | 10 |
| `client.hubs` | 16 | | `client.timeline` | 4 |
| `client.library` | 126 | | `client.transcoder` | 9 |
| `client.libraryCollections` | 3 | | `client.ultraBlur` | 2 |
| `client.libraryPlaylists` | 13 | | `client.updater` | 3 |
| `client.liveTV` | 7 | | `client.users` | 23 |
| `client.log` | 3 | | | |

---

## What changed in the Plex API

The original package was generated from specification **0.0.3**. This one is generated from
**1.1.1**. That is not an incremental revision — the specification was substantially rewritten,
and the surface grew from roughly 60 operations to **405**.

### The API is much larger, and organised differently

The old package exposed 18 namespaces built around a single Plex Media Server. The current
specification has 33, and the growth is concentrated in areas the old one barely covered:

- **Library** is now 126 operations. Filtering, sorting, collections, hub management, per-type
  metadata, and the `mediaQuery` filter language are all described where previously only a
  handful of list endpoints were.
- **Live TV and DVR** are new: `dvrs` (16), `epg` (11), `liveTV` (7), `subscriptions` (10) and
  `downloadQueue` (9) cover tuners, guide data, scheduled recordings and the grab queue.
- **Playback** (26) and **Transcoder** (9) describe session control, decision endpoints and
  transcode management as first-class operations.
- **Devices** (13), **Provider** (8), **Content** (13) and **Events** (3) cover the cloud-side
  surfaces — companion devices, metadata providers, and the event stream.

### Authentication gained JWTs alongside tokens

`X-Plex-Token` still authenticates every request, but it now carries one of two things: a
traditional access token from plex.tv, or a **JWT** obtained through a new device-registration
flow. The specification describes JWTs as short-lived (seven days), signed with ED25519, and
revocable per device — none of which the old specification mentioned.

Four operations under `client.authentication` implement it, all against
`https://clients.plex.tv/api/v2`: `registerDeviceJWK` registers a device's public key,
`getAuthNonce` and `getAuthKeys` support the handshake, and `exchangeJWTToken` trades a signed
client JWT for a Plex one.

The OAuth PIN flow is unchanged in shape but is now fully described, including the legacy XML
variant (`createLegacyPin`) for older clients.

### Requests are addressed to six different hosts

The old specification described one server. The current one recognises that Plex is several
services, and pins an explicit host per operation:

| Host | Operations | What lives there |
| --- | --: | --- |
| The user's Plex Media Server | 353 | Libraries, playback, transcoding, server settings |
| `https://plex.tv/api/v2` | 27 | Authentication, account, devices, sharing |
| `https://plex.tv/api` | 11 | Legacy XML: friends, home users, claim tokens |
| `https://plex.tv` | 6 | Site-root endpoints such as `pins.xml` |
| `https://discover.provider.plex.tv` | 4 | Discover metadata provider |
| `https://clients.plex.tv/api/v2` | 4 | JWT device registration and companion endpoints |

This is handled for you: each operation declares its host, and only the ones targeting your own
server use the address you configured.

### Server addressing is described properly

The old specification offered one templated server, `{protocol}://{ip}:{port}`, defaulting to a
private address. The current one describes three, including `plex.direct` — the scheme by which
Plex serves a valid TLS certificate for what is otherwise a bare IP, by encoding the address
into the hostname. `PlexServer.plexDirect(ip:identifier:)` builds it.

### The schemas are far better factored

The old specification inlined nearly everything, which is why the previous package expanded to
over 1,100 files. The current one defines 112 reusable component schemas and references them
throughout, so the whole API generates into 240 model types covering 1,473 properties.

### Response fields are optional

Every generated property is optional, deliberately, even where the specification marks it
required. The specification contradicts itself here: decoding the example payloads it publishes
against the models its own `required` lists describe fails for 13 schemas — `Stream` requires
`streamType` and then publishes an example without it; `Items` inherits `title` as required and
publishes an example with neither `title` nor `type`.

The examples are the better evidence. A real server omits fields depending on library type,
agent and version, and a non-optional property turns any such omission into a thrown error that
fails the whole request rather than leaving one value `nil`.

---

## Migrating from plexswift 0.10

| Then | Now |
| --- | --- |
| `Client(security: .accessToken(token))` | `PlexClient(server:token:identity:)` — the address is required |
| No way to set the server | `PlexServer.host`, `.plexDirect`, `.url`, `.localhost` |
| `Response<T>` with a case per status code | The decoded body is returned; failures throw `PlexError` |
| `switch response.data { case .object(let o): … }` | `let value = try await client.library.…()` |
| `PlexswiftError` | `PlexError`, with `.api`, `.transport` and `.decoding` |
| `client.server`, `client.video`, `client.sessions` | See the [namespace table](#namespaces) |
| `AnyValue` | `AnyJSON`, with typed accessors |
| No client identity headers | `ClientIdentity` |
| Mutable, non-`Sendable` `Client` | `PlexClient` is `Sendable`; `with(server:)` / `with(token:)` return copies |
| `throws` (untyped) | `throws(PlexError)` — `catch` is exhaustive |
| iOS 13+, Swift 5 | iOS 18+, Swift 6 language mode |

The response-handling change is the one that touches every call site. Where you previously
switched over a `Response` enum, you now write a `do`/`catch` — usually once, around a group of
calls, instead of at each one.

## Working on this package

```bash
swift test                       # 222 tests
python Tools/generate.py         # regenerate from Spec/plex-api-spec.yaml
python Tools/generate.py --check # what CI runs
cd Tools && python -m unittest discover -s . -p "test_*.py"
```

Everything under `Sources/Plexswift/Generated` and `Tests/PlexswiftTests/Generated` is
generated; edits there are overwritten. The handwritten runtime is in
`Sources/Plexswift/Core`. To move to a newer specification, follow
[`Spec/README.md`](Spec/README.md).

The generator emits a decoding test for each of the 112 example payloads the specification
publishes, so a specification change that breaks a model shows up as a test failure rather than
at runtime.

## Licence

MIT — see [LICENSE.md](LICENSE.md). The Plex OpenAPI specification is maintained by
[LukeHagar](https://github.com/LukeHagar/plex-api-spec).
