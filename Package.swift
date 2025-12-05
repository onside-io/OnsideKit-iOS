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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.1.21/OnsideKit.xcframework.zip",
            checksum: "d637c03abcd2bc07d8afbbac26ea79fcb6a1d33c239468ecc693808759042fe5"
        )
    ]
)
