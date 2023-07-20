// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GKNavigationBarSwift",
    // 支持的平台和版本
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "GKNavigationBarSwift",
            targets: ["GKNavigationBarSwift"]),
    ],
    targets: [
        .target(
            name: "GKNavigationBarSwift",
            path: "Sources"
        )
    ]
)
