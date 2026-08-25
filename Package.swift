// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Plexswift",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1)
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
                .swiftLanguageMode(.v5)
            ]
        ),
        .testTarget(
            name: "PlexswiftTests",
            dependencies: ["Plexswift"],
            swiftSettings: [
                .swiftLanguageMode(.v5)
            ]
        )
  ]
)
