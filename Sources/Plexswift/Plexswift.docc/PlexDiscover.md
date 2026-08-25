# Plex Discover

Search, hubs, watchlist and streaming availability for titles nobody owns.

## Overview

Everything else in this package is generated from the published Plex specification. Discover is
not in it.

Discover is the part of Plex that knows about titles independently of any server: the catalogue
behind the search field, the rows on a Discover screen, the account's watchlist, and the one
thing a media server cannot answer at all — which services a title is currently streaming on,
and for how much. The Plex apps reach it through two hosts, `discover.provider.plex.tv` and
`metadata.provider.plex.tv`, and ``DiscoverAPI`` wraps those calls.

It is an ordinary namespace otherwise. The operations are ``PlexOperation``s like any other,
they declare their host the way generated operations do, and they return their container
through ``PlexClient/perform(_:)``.

```swift
let matches = try await client.discover.searchDiscoverProvider(query: "severance", searchTypes: "tv")
guard let key = matches.mediaContainer?.results.first?.metadata?.ratingKey else { return }

let details = try await client.discover.getDiscoverMetadata(ratingKey: key, includeAvailability: true)
for offer in details.mediaContainer?.metadata?.first?.availability ?? [] {
    print(offer.title ?? "", offer.offerType ?? "")
}
```

### Discover is walked, not addressed

A media server's API is addressed: a path is assembled from a section identifier and a rating
key. Discover is walked. A hub arrives with its first few items and a ``DiscoverHub/key``, a
directory arrives with a ``DiscoverDirectory/key``, and following one is how the next screen is
fetched. ``DiscoverAPI/getDiscoverItems(key:count:containerStart:containerSize:additionalQueryItems:)``
takes whatever key it is handed, including one that carries its own query string, which several
do.

```swift
let screen = try await client.discover.getDiscoverHubs(count: 12)
for hub in screen.mediaContainer?.hub ?? [] {
    guard hub.more == true, let key = hub.key else { continue }
    let rest = try await client.discover.getDiscoverItems(key: key, count: 40)
    print(hub.title ?? "", rest.mediaContainer?.metadata?.count ?? 0)
}
```

Paging is the same as elsewhere in Plex and unlike most HTTP APIs: the window travels in the
`X-Plex-Container-Start` and `X-Plex-Container-Size` headers, which `containerStart` and
`containerSize` set, and the total comes back in `X-Plex-Container-Total-Size` — reachable from
``PlexResponse/headers`` when the operation is sent with ``PlexClient/send(_:)``.

Rating keys follow the walking rule too. A Discover key is an opaque hexadecimal string —
`5d7768ba96b655001fdc0408` — and belongs to the providers; a media server's rating key is a
small integer and belongs to that server. Neither is meaningful to the other.

### Two rating keys, two metadata types

``DiscoverMetadata`` is deliberately not ``Metadata``. The two describe different things: a
media server's item is about a file the account has, and this one is about a title that exists.
Only Discover's carries ``DiscoverMetadata/availability``, ``DiscoverMetadata/slug`` and the
aggregator scores in ``DiscoverMetadata/ratings``; only the media server's has the file-level
detail underneath it.

### Decoding never throws

Plex owes nobody notice before changing an endpoint it never published, so these models are
built to bend rather than break. Every property is optional, and `init(from:)` cannot fail:

- A number that arrives quoted still reads as a number, and an identifier that arrives bare
  still reads as a string.
- `1`, `true` and `"1"` are all true.
- A single object is accepted where a list was expected — Plex's JSON is derived from its XML,
  and a collection of one is sometimes written as its member alone.
- One malformed item in a row is skipped, and the rest of the row survives.
- An unfamiliar key is ignored.

The cost is that a typo in a field name looks exactly like a field Plex removed: both are nil.
The limit is that a body which is not a container at all still fails, so an error page cannot
masquerade as an empty result.

Otherwise these are ordinary models: `Codable`, `Hashable` and `Sendable`, with memberwise
initialisers, exactly like the generated ones.

### Artwork

Most artwork needs nothing built: the entries in ``DiscoverMetadata/image`` are already
absolute URLs on Plex's static host.

```swift
let poster = item.image?.first { $0.type == "coverPoster" }?.url
```

``DiscoverMetadata/thumb`` and ``DiscoverMetadata/art`` are provider-relative, and go through
the provider's copy of the photo transcoder. It is the same endpoint as the media server's, at
the same path, so ``Operations/TranscodeDiscoverImage`` mirrors ``Operations/TranscodeImage``
and differs only in the host it is addressed to. Build the request rather than sending it, as
with any other image URL in this package:

```swift
var configuration = client.configuration
configuration.tokenPlacement = .queryItem      // an image loader cannot set headers
let request = try PlexClient(configuration: configuration)
    .makeRequest(for: Operations.TranscodeDiscoverImage(url: item.thumb, width: 300, minSize: .n1))
```

### Passing through what is not named

The providers accept parameters that are documented nowhere, this package included. Every
Discover operation takes `additionalQueryItems` so that trying one does not require forking the
SDK.

```swift
let response = try await client.discover.getDiscoverItems(
    key: "/hubs/home/recommended",
    additionalQueryItems: [URLQueryItem(name: "excludeFields", value: "summary")]
)
```

### Where the specification overlaps

Two of these endpoints are in the specification, and their generated operations remain.

``Operations/SearchDiscover`` types the search response as a plain metadata container. The
provider answers with scored results grouped by source, so that operation decodes to an empty
container even when there were matches — prefer
``DiscoverAPI/searchDiscoverProvider(query:limit:searchTypes:searchProviders:includeMetadata:additionalQueryItems:)``.

``Operations/GetWatchlist`` works, but decodes into ``Metadata``, which has nowhere to put the
availability and slug fields a watchlist entry carries.
``DiscoverAPI/getDiscoverWatchlist(filter:libtype:sort:containerStart:containerSize:additionalQueryItems:)``
decodes into ``DiscoverMetadata`` instead, so an entry can be handed straight back to
``DiscoverAPI/getDiscoverMetadata(ratingKey:includeUserState:includeReviews:includeExtras:includeChildren:includeRelated:includeRelatedCount:includeOnDeck:includeAvailability:includeExternalMedia:asyncAugmentMetadata:additionalQueryItems:)``.

Adding to and removing from the watchlist are specified operations, under
``ProviderAPI/addToWatchlist(uri:)`` and ``ProviderAPI/removeFromWatchlist(uri:)``. Both take
the item's ``DiscoverMetadata/guid`` as their `uri`.

## Topics

### Making requests

- ``DiscoverAPI``

### Items

- ``DiscoverMetadata``
- ``DiscoverItemsResponse``
- ``DiscoverItemsContainer``

### Hubs and directories

- ``DiscoverHubsResponse``
- ``DiscoverHubsContainer``
- ``DiscoverHub``
- ``DiscoverDirectory``

### Search results

- ``DiscoverSearchResponse``
- ``DiscoverSearchContainer``
- ``DiscoverSearchResultGroup``
- ``DiscoverSearchResult``

### Details of an item

- ``DiscoverAvailability``
- ``DiscoverRating``
- ``DiscoverReview``
- ``DiscoverGuid``
- ``DiscoverImage``
- ``DiscoverTag``
- ``DiscoverMedia``
- ``DiscoverPart``
- ``DiscoverUserState``
- ``DiscoverOnDeck``
