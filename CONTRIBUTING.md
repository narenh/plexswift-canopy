# Contributing

Pull requests are welcome. This is a fork that owns its own code generation, so unlike the
upstream package it was forked from, changes can be made and reviewed here directly.

## Where a change belongs

The repository has three parts, and almost every change belongs in exactly one of them.

| Path | What it is | Edit it? |
| --- | --- | --- |
| `Sources/Plexswift/Core/` | The handwritten runtime — client, server resolution, auth, errors, encoding | Yes |
| `Sources/Plexswift/Discover/` | Handwritten support for the Discover and metadata providers, which the specification does not describe | Yes |
| `Sources/Plexswift/Generated/`, `Tests/PlexswiftTests/Generated/` | Emitted by `Tools/generate.py` | **No** — edits are overwritten |
| `Tools/` | The generator itself | Yes |
| `Spec/plex-api-spec.yaml` | The vendored OpenAPI specification | Only to move to a new version |

If a generated file is wrong, the fix goes in `Tools/`, not in the file. CI regenerates from
the vendored spec and fails if the result differs from what is committed, so a hand-edit would
be caught there even if it passed review.

## Getting set up

```bash
swift build
swift test

python -m pip install --requirement Tools/requirements.txt
cd Tools && python -m unittest discover -s . -p "test_*.py"
```

The package requires Swift 6.0 or later and builds in Swift 6 language mode.

## Making a change

**To the runtime.** Add or adjust the tests in `Tests/PlexswiftTests/` alongside it. The suite
runs without a network — `HTTPTransport` is the seam, and `MockTransport` answers from a
script — so there is no reason for a change to arrive untested.

**To `Discover/`.** These endpoints are undocumented, so nothing regenerates them and nothing
external checks them: the tests in `DiscoverRequestTests.swift` and `DiscoverDecodingTests.swift`
are the only record of what Plex sends and expects. Keep decoding non-throwing and every
property optional — a model that can fail turns a field Plex renamed into a broken screen in a
shipped app — and prefer adding a parameter to a method over widening a model that already
decodes what the provider sends.

**To the generator.** Add a case to the relevant file in `Tools/tests/`, then regenerate:

```bash
python Tools/generate.py
swift test
```

Commit the regenerated sources in the same commit as the generator change, so that every
commit builds.

**To the specification version.** Follow [`Spec/README.md`](Spec/README.md). Expect the
generated diff to be large; review the generator's behaviour rather than the output file by
file, and check that the decoding tests still pass — they decode the example payload the
specification publishes for each schema, so they catch a model that no longer matches.

## Conventions

- Documentation comments explain *why* a decision was made where it is not obvious, especially
  where the generator deliberately departs from the specification. Several such departures
  exist because the specification contradicts itself; each one says so at the point of the
  decision.
- Tests are named for the behaviour they pin, not the function they call.
- The README's examples are compiled as part of the test suite
  (`READMEExampleTests.swift`). If you change an example, change it in both places.

## Reporting a problem

Open an issue with the operation or type involved, what you expected, and what happened. If it
is a decoding failure, the thrown `PlexError.decoding` carries the raw response body — include
it, with any token redacted.

Problems in the API description itself belong upstream, at
[`LukeHagar/plex-api-spec`](https://github.com/LukeHagar/plex-api-spec). Problems in how this
package renders that description belong here.
