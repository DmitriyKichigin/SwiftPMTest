// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPackage",
    platforms: [.iOS(.v13), .macCatalyst(.v14)],
    products: [
        .library(name: "CoreNetwork", targets: ["CoreNetworkWrapper"]),
        .library(name: "Integration", targets: ["IntegrationWrapper"]),
        .library(name: "CoreUI", targets: ["CoreUIWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/ayham-achami/CArch", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CRest", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CUIKit.git", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CRepository.git", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CFoundation.git", branch: "mainline"),
        .package(url: "https://github.com/realm/realm-cocoa.git", .upToNextMajor(from: "10.32.0")),
        .package(url: "https://github.com/Alamofire/AlamofireImage.git", .upToNextMajor(from: "4.2.0"))
    ],
    targets: [
        // CoreNetwork
        .target(name: "CoreNetworkWrapper",
                dependencies: [.target(name: "CoreNetwork"),
                               .product(name: "CFoundation", package: "CFoundation"),
                               .product(name: "CRest", package: "CRest"),
                               .product(name: "AlamofireImage", package: "AlamofireImage"),
                               .product(name: "CArch", package: "CArch")],
                path: "CoreNetworkWrapper"),
        .binaryTarget(
            name: "CoreNetwork",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CoreNetwork/526911581/CoreNetwork-27837641.526911581.xcframework.zip",
            checksum: "ba6f15c9b98487952b17dfa4a5234342a5a7d1bc7b25fa89803cdde7d619a943"),
        // Integration
        .target(name: "IntegrationWrapper",
                dependencies: [.target(name: "Integration"),
                               .target(name: "CoreNetworkWrapper"),
                               .product(name: "CRepository", package: "CRepository"),
                               .product(name: "CFoundation", package: "CFoundation"),
                               .product(name: "RealmSwift", package: "realm-cocoa"),
                               .product(name: "CArch", package: "CArch")],
                path: "IntegrationWrapper"),
        .binaryTarget(
            name: "Integration",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Integration/496814869/Integration-27843082.496814869.xcframework.zip",
            checksum: "48720a196ccf5db819f4aa0f61acae7a798573b883b539fe8e5e81a60cfc29b4"),
        // CoreUI
        .target(name: "CoreUIWrapper",
                dependencies: [.target(name: "CoreUI"),
                               .target(name: "CoreNetworkWrapper"),
                               .product(name: "CUIKit", package: "CUIKit"),
                               .product(name: "CArch", package: "CArch"),
                               .product(name: "CFoundation", package: "CFoundation")],
                path: "CoreUIWrapper"),
        .binaryTarget(
            name: "CoreUI",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CoreUI/435867645/CoreUI-27843187.435867645.xcframework.zip",
            checksum: "7411f5f5e01b467cb7c4f3186dbcb074dd381443f24aa1957557260150ee37f6")
    ]
)
