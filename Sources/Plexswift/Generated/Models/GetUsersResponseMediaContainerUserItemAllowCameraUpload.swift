// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Indicates if the user is allowed to upload from a camera.
public enum GetUsersResponseMediaContainerUserItemAllowCameraUpload: Int, Codable, Hashable, Sendable, CaseIterable {
    case n0 = 0
    case n1 = 1
}
