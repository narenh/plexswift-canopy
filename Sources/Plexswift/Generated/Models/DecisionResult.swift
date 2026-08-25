// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct DecisionResult: Codable, Hashable, Sendable {
    /// The maximum bitrate set when item was added
    public let availableBandwidth: Int?

    public let directPlayDecisionCode: Int?

    public let directPlayDecisionText: String?

    public let generalDecisionCode: Int?

    public let generalDecisionText: String?

    /// The code indicating the status of evaluation of playback when client indicates `hasMDE=1`
    public let mdeDecisionCode: Int?

    /// Descriptive text for the above code
    public let mdeDecisionText: String?

    public let transcodeDecisionCode: Int?

    public let transcodeDecisionText: String?

    public init(
        availableBandwidth: Int? = nil,
        directPlayDecisionCode: Int? = nil,
        directPlayDecisionText: String? = nil,
        generalDecisionCode: Int? = nil,
        generalDecisionText: String? = nil,
        mdeDecisionCode: Int? = nil,
        mdeDecisionText: String? = nil,
        transcodeDecisionCode: Int? = nil,
        transcodeDecisionText: String? = nil
    ) {
        self.availableBandwidth = availableBandwidth
        self.directPlayDecisionCode = directPlayDecisionCode
        self.directPlayDecisionText = directPlayDecisionText
        self.generalDecisionCode = generalDecisionCode
        self.generalDecisionText = generalDecisionText
        self.mdeDecisionCode = mdeDecisionCode
        self.mdeDecisionText = mdeDecisionText
        self.transcodeDecisionCode = transcodeDecisionCode
        self.transcodeDecisionText = transcodeDecisionText
    }
}
