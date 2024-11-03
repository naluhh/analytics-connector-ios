// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "analytics-connector-ios",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13),
        .tvOS(.v9),
        .watchOS(.v3),
        .visionOS(.v1),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AnalyticsConnector",
            targets: ["AnalyticsConnector"]
        ),
        .library(
            name: "AnalyticsConnectorFramework",
            targets: ["AnalyticsConnectorFramework"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        .target(
            name: "AnalyticsConnector",
            path: "Sources/AnalyticsConnector",
            exclude: ["Info.plist"]),
        .binaryTarget(name: "AnalyticsConnectorFramework",
            url: "https://github.com/amplitude/analytics-connector-ios/releases/download/v1.2.4/AnalyticsConnector.xcframework.zip",
            checksum: "605073ac7b478d9bd5fad41505377f50f3d10250771435dd2f04003bcaf9c820"),
        .testTarget(
            name: "AnalyticsConnectorTests",
            dependencies: ["AnalyticsConnector"],
            path: "Tests/AnalyticsConnectorTests",
            exclude: ["Info.plist"]),
    ]
)
