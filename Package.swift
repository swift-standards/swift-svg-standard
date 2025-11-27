// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-svg-standard",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11)
    ],
    products: [
        .library(
            name: "SVG Standard",
            targets: ["SVG Standard"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-w3c-svg.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "SVG Standard",
            dependencies: [
                .product(name: "W3C SVG", package: "swift-w3c-svg")
            ]
        ),
        .testTarget(
            name: "SVG Standard Tests",
            dependencies: ["SVG Standard"]
        )
    ],
    swiftLanguageModes: [.v6]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("StrictUnsafe"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault")
]

for index in package.targets.indices {
    package.targets[index].swiftSettings = (package.targets[index].swiftSettings ?? []) + swiftSettings
}
