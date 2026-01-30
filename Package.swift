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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.4.1/OnsideKit.xcframework.zip",
            checksum: "c4a4b465e11c8019c62a780c0a3be745565f8ae01c2a5bb779fb9374f1b64ae1"
        )
    ]
)
