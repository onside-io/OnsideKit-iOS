// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnsideKit",
    platforms: [.iOS("17.4")],
    products: [
        .library(name: "OnsideKit",     targets: ["OnsideKit"]),
        .library(name: "OnsideKitLite", targets: ["OnsideKitLite"])
    ],
    targets: [
        .binaryTarget(
            name: "OnsideKit",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/3.0.1/OnsideKit.xcframework.zip",
            checksum: "6ef8dbb7f63a3012ef6a3752b4663e738859374bb2ffeb46fdeb278aa3ec89d8"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/3.0.1/OnsideKitLite.xcframework.zip",
            checksum: "c346702f078f9ab6b6526738722dc9e1ee46fd4b897219fc36b7342086f766a0"
        )
    ]
)
