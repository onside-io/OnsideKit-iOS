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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.2.0/OnsideKit.xcframework.zip",
            checksum: "427b7e9b92bae0b6afff7e84481a02a7afbf73a994834e97895f23e8d744d616"
        )
    ]
)
