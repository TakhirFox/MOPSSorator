// swift-tools-version: SWIFT_VERSION
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MODULE_NAME",
    defaultLocalization: "ru",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MODULE_NAME",
            targets: ["MODULE_NAME"]
        )
    ],
    dependencies: [
        .package(name: "Design", path: "../Design")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MODULE_NAME",
            dependencies: [
                "Design"
            ]INCLUDE_RESOURCE
        )
    ]
)
