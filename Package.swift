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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.0/OnsideKit.xcframework.zip",
            checksum: "173b3cfbdbf6ba519615eb7ed9145395630fafed9d508ca339df341a77e802dc"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.0/OnsideKitLite.xcframework.zip",
            checksum: "d7b5e0797cdac97897a1f0d4f19a8cc450795bbb372d8c09fdf87e4498c86778"
        )
    ]
)
