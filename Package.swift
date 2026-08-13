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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.2.2/OnsideKit.xcframework.zip",
            checksum: "6d1469a454072117d2e7da450e775722a6f0f10e0f8eceb8071f2b538d691df6"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.2.2/OnsideKitLite.xcframework.zip",
            checksum: "1678aa2850c3d026800d706ec72c7f87092ec18d7aa03e8df8e1610be81dad97"
        )
    ]
)
