// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(

    // Name of the package.
    name: "GameFissionSimulatorCore",

    // Can run only on this platform.
    // This "requirement" is actually only for SwiftLint.
    platforms: [
        .macOS(.v12)
    ],

    // This is a library package.
    products: [
        .library(
            name: "GameFissionSimulatorCore",
            targets: ["GameFissionSimulatorCore"]
        )
    ],

    // This package declare this dependencies (package level).
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.58.2")
    ],

    // We have the followin targets.
    targets: [

        // Main target, without any dependencies.
        // SwiftLint is used as plugin when the project is build.
        .target(
            name: "GameFissionSimulatorCore",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),

        // Test target, with only one dependency : The main package.
        // SwiftLint is used as plugin when the project is tested.
        .testTarget(
            name: "GameFissionSimulatorCoreTests",
            dependencies: ["GameFissionSimulatorCore"],
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        )
    ]
)
