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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.7.5/OnsideKit.xcframework.zip",
            checksum: "9337ff53c594e09a20a4f2fd1bbf945538ce5b07373abab55bee3d11576fc182"
        )
    ]
)
