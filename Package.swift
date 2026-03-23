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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.7.3/OnsideKit.xcframework.zip",
            checksum: "19cd03dd193f5dacdafecf15ea8dc9f1dbd82d5d7aed9f5190c2ed5dac576974"
        )
    ]
)
