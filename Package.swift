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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.1.17/OnsideKit.xcframework.zip",
            checksum: "f903497f82621ef182d94dd07eb882bf246e6d1eb037f77d80f7de1b1571ecd2"
        )
    ]
)
