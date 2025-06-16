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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.1.17/OnsideKit.xcframework.zip",
            checksum: "cf37771a2dcac70f4753e70cb54c8a6429f57e83e36bf520998df5f0587fa834"
        )
    ]
)
