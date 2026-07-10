// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-svg-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "SVG Standard",
            targets: ["SVG Standard"]
        ),
        .library(
            name: "SVG Standard Test Support",
            targets: ["SVG Standard Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-w3c/swift-w3c-svg.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "SVG Standard",
            dependencies: [
                .product(name: "W3C SVG", package: "swift-w3c-svg")
    ]
        ),
        .target(
            name: "SVG Standard Test Support",
            dependencies: [
                "SVG Standard",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "SVG Standard Tests",
            dependencies: [
                "SVG Standard",
                "SVG Standard Test Support",
            ],
            path: "Tests/SVG Standard Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
