// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-svg-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "SVG Standard",
            targets: ["SVG Standard"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-w3c-svg", from: "0.1.4"),
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
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings =
        existing + [
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
        ]
}
