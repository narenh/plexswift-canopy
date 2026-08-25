// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct DownloadQueueItem: Codable, Hashable, Sendable {
    public let decisionResult: DecisionResult?

    /// The error encountered in transcoding or decision
    public let error: String?

    public let id: Int?

    public let key: String?

    public let queueId: Int?

    /// The state of the item:
    /// - deciding: The item decision is pending
    /// - waiting: The item is waiting for transcode
    /// - processing: The item is being transcoded
    /// - available: The item is available for download
    /// - error: The item encountered an error in the decision or transcode
    /// - expired: The transcoded item has timed out and is no longer available
    public let status: DownloadQueueItemStatus?

    /// The transcode session object which is not yet documented otherwise it'd be a $ref here.
    public let transcode: AnyJSON?

    /// The transcode session if item is currently being transcoded
    public let transcodeSession: TranscodeSession?

    public init(
        decisionResult: DecisionResult? = nil,
        error: String? = nil,
        id: Int? = nil,
        key: String? = nil,
        queueId: Int? = nil,
        status: DownloadQueueItemStatus? = nil,
        transcode: AnyJSON? = nil,
        transcodeSession: TranscodeSession? = nil
    ) {
        self.decisionResult = decisionResult
        self.error = error
        self.id = id
        self.key = key
        self.queueId = queueId
        self.status = status
        self.transcode = transcode
        self.transcodeSession = transcodeSession
    }

    private enum CodingKeys: String, CodingKey {
        case decisionResult = "DecisionResult"
        case error
        case id
        case key
        case queueId
        case status
        case transcode
        case transcodeSession = "TranscodeSession"
    }
}
