// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "testing",
    platforms: [
        .macOS(.v26)
    ],
    dependencies: [
        .package(path: ".."),
        .package(url: "https://github.com/swift-foundations/swift-testing.git", branch: "main"),
    ],
    targets: [
        .testTarget(
            name: "SVG Standard Performance Tests",
            dependencies: [
                .product(name: "SVG Standard", package: "swift-svg-standard"),
                .product(name: "Testing", package: "swift-testing"),
            ],
            path: "SVG Standard Performance Tests"
        ),
        .testTarget(
            name: "SVG Standard Snapshot Tests",
            dependencies: [
                .product(name: "SVG Standard", package: "swift-svg-standard"),
                .product(name: "Testing", package: "swift-testing"),
            ],
            path: "SVG Standard Snapshot Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem
}
