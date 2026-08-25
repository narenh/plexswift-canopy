# Changelog

## Unreleased — 1.0.0-alpha.1

The first release of this fork. It shares no code with
[`LukeHagar/plexswift`](https://github.com/LukeHagar/plexswift) 0.10.5 beyond the name, and is
a source-incompatible rewrite. See
[Migrating from plexswift 0.10](README.md#migrating-from-plexswift-010).

### Why a rewrite

The archived package did not compile — a clean checkout of its `main` fails with 1,801 errors
under Swift 6.2, because its last generation run emitted an API protocol referencing request
and response types it never wrote. It also could not have made a request: no API exposed a way
to set the server address, so every call resolved to the unsubstituted URL template
`{protocol}://{ip}:{port}`.

Regenerating in place needs the upstream author's Speakeasy account, so this fork owns its
generation instead: the specification is vendored under `Spec/`, the generator lives in
`Tools/`, and CI fails if the two drift apart.

### Added

- 405 operations across 33 namespaces, generated from Plex OpenAPI specification 1.1.1 (the
  previous package was generated from 0.0.3, which described roughly 60).
- 240 model types, each checked by decoding the example payload the specification publishes
  for it.
- `PlexServer`, covering `plex.direct`, host/port and explicit URLs. Every case resolves to a
  concrete URL.
- `ClientIdentity`, sending the `X-Plex-*` headers Plex expects. The previous package sent
  none, so callers could not appear in Authorized Devices or use the OAuth PIN flow.
- `HTTPTransport`, so requests can be intercepted, stubbed or wrapped.
- Support for the JWT device-registration flow the current specification describes.
- A test suite — 222 tests, where there were previously none.

### Changed

- Operations return the decoded response body and throw `PlexError`, instead of returning
  `Response<T>` with a case per status code.
- Every method that can fail is declared `throws(PlexError)`, so `catch` is exhaustive.
- `PlexClient` is `Sendable` and immutable; `with(server:)` and `with(token:)` return copies.
- Every model property is optional. The specification's `required` lists contradict its own
  example payloads for 13 schemas, and a real server omits fields freely.
- Deployment targets are iOS 18, macOS 15, tvOS 18, watchOS 11 and visionOS 2; the package
  builds in Swift 6 language mode.
- `AnyValue` became `AnyJSON`, with typed accessors.

### Removed

- The Speakeasy nightly generation workflow, which this fork cannot run and which would
  overwrite its work.
- `Sources/plexswift`, a dead lowercase duplicate that SwiftPM never compiled.

---

Release history for the upstream package this was forked from, covering 0.0.2 through 0.10.5,
is at [`LukeHagar/plexswift/releases`](https://github.com/LukeHagar/plexswift/releases). It was
removed here because it describes a generation pipeline this fork no longer uses.
