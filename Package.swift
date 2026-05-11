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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.7.6/OnsideKit.xcframework.zip",
            checksum: "08ee5c7c183d62576486f84cfd20f80ebbc453492b07eaa32377a59f923d7a5d"
        )
    ]
)
