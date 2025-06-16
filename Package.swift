// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnsideKit",
    products: [
        .library(
            name: "OnsideKit",
            targets: ["OnsideKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "OnsideKit",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.1.20/OnsideKit.xcframework.zip",
            checksum: "227675ffc843e3a205f0c3f4ff954f1041724d1aade6f3eac81811ceca6f2643"
        )
    ]
)
