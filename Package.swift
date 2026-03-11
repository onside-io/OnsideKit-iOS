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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.7.0/OnsideKit.xcframework.zip",
            checksum: "2f785edd8a28d993e05d9e0ef0376b3e90ef74cd5abe5beb8fce98b01678e183"
        )
    ]
)
