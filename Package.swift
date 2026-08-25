// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Plexswift",
    platforms: [
        // Raised from iOS 13 so the package can use the modern concurrency and Foundation
        // APIs directly rather than through availability-gated fallbacks. These five versions
        // are the same OS generation, released together.
        .iOS(.v18),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2)
    ],
    products: [
        .library(
            name: "Plexswift",
            targets: ["Plexswift"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Plexswift",
            dependencies: [],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "PlexswiftTests",
            dependencies: ["Plexswift"],
            resources: [
                // Example payloads extracted from the specification, decoded by
                // GeneratedModelDecodingTests.
                .copy("Generated/Fixtures")
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        )
  ]
)
