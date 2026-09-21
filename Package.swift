// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnsideKit",
    products: [
        .library(name: "OnsideKit",     targets: ["OnsideKit"]),
        .library(name: "OnsideKitLite", targets: ["OnsideKitLite"])
    ],
    targets: [
        .binaryTarget(
            name: "OnsideKit",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/2.0.0/OnsideKit.xcframework.zip",
            checksum: "b4dadc1fbc5e0d573f98ca4631d66807e1c7a72b75a9fdacd5cfcb054145379e"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/2.0.0/OnsideKitLite.xcframework.zip",
            checksum: "8ac0bee868d563379ac1b5153e6d5eb6d9d01e2fcec0062916d7828f1731599f"
        )
    ]
)
