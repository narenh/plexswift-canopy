# Vendored OpenAPI specification

`plex-api-spec.yaml` is the source of truth for everything under
`Sources/Plexswift/Generated`. It is vendored rather than fetched at build time so that a
given commit of this repository always describes exactly one version of the Plex API, and so
that builds are reproducible offline.

| | |
| --- | --- |
| Upstream | [`LukeHagar/plex-api-spec`](https://github.com/LukeHagar/plex-api-spec) |
| File | [`plex-api-spec.yaml`](https://raw.githubusercontent.com/LukeHagar/plex-api-spec/refs/heads/main/plex-api-spec.yaml) |
| Spec version | 1.1.1 |
| OpenAPI version | 3.1.1 |
| SHA-256 | `ff8801eb6c7904e6298215dd789521750e4af0f18b5fde0999bb544d15335070` |
| Vendored | 2026-08-25 |

## Updating

```bash
curl -sSL -o Spec/plex-api-spec.yaml \
  https://raw.githubusercontent.com/LukeHagar/plex-api-spec/refs/heads/main/plex-api-spec.yaml
python Tools/generate.py
swift test
```

Update the table above with the new version and checksum, then commit the spec and the
regenerated sources together. CI fails if `Sources/Plexswift/Generated` does not match what
the generator produces from the vendored spec.
