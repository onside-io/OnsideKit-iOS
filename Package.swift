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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.5.0/OnsideKit.xcframework.zip",
            checksum: "1169c88a45cb74ff569b8ccea041af64a4bab0ab393d7699e8fbb922d414ae6d"
        )
    ]
)
