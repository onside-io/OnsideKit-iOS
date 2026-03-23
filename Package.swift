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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.7.4/OnsideKit.xcframework.zip",
            checksum: "3c6d723f81c454969b54ff1373e6ccfa47790f94399fa2204acada0242099d42"
        )
    ]
)
