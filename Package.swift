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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.7.2/OnsideKit.xcframework.zip",
            checksum: "a2f03a70ec7fe3f6845245c748d6617b37dfbd813e7f76aa3c2bc2c0f5ec79ba"
        )
    ]
)
