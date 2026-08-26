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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.3.0/OnsideKit.xcframework.zip",
            checksum: "4dd38962fbc32be94fef55aecc0f3a3f411236297650af3af9ca709a5f54d903"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.3.0/OnsideKitLite.xcframework.zip",
            checksum: "6dae003066e18d51bbea8f292145fa91d83c1fb0aa16bb299be33b31b7686b18"
        )
    ]
)
