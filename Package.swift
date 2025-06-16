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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.0.1/OnsideKit.xcframework.zip",
            checksum: "d6a9e02b969164ee7c9c04c1b19365a39d8bb3c6e5bdb6fd5a560ab26f0989a5"
        )
    ]
)
