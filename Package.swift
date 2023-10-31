// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPackage",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Core", targets: ["CoreWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", branch: "main"),
        .package(url: "https://github.com/ra1028/DifferenceKit.git", from: "1.3.0"),
        .package(url: "https://github.com/ayham-achami/CFoundation.git", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CArchSwinject.git", branch: "feature/fix-registration")
    ],
    targets: [
        // Core
        .target(
            name: "CoreWrapper",
            dependencies: [
                "CFoundation",
                "CArchSwinject",
                "DifferenceKit",
                .target(name: "CoreBinary")
            ],
            path: "CoreWrapper",
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .binaryTarget(name: "CoreBinary",
                      url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/new/core/Core.zip",
                      checksum: "1c500dc79929bb5726e7b04bfdef8d70244f058e14a1ef67d9662e91bbaaea49")
    ]
)
