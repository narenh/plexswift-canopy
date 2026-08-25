// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Event type that triggered the webhook.
public enum WebhookPayloadEvent: String, Codable, Hashable, Sendable, CaseIterable {
    case mediaPlay = "media.play"
    case mediaPause = "media.pause"
    case mediaResume = "media.resume"
    case mediaStop = "media.stop"
    case mediaScrobble = "media.scrobble"
    case mediaRate = "media.rate"
    case libraryNew = "library.new"
    case libraryOnDeck = "library.on.deck"
}
