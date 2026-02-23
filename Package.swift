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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.6.0/OnsideKit.xcframework.zip",
            checksum: "2250f4c5261de1a202dc3c27e8d88ed468e6954bf449256832f57c5c99197b4a"
        )
    ]
)
