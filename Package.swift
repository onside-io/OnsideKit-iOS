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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.4.0/OnsideKit.xcframework.zip",
            checksum: "7c2e21b92dd63b4b5ff65bc5a1c8798530791e1ad056dc4fcd8842c19ce42510"
        )
    ]
)
