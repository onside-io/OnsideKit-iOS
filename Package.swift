// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let url = "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.8.0/OnsideKit.xcframework.zip"
let checksum = "85af10c0cdfa33c7b77a5506230c7f04e838e6e1dc942257ff26f3c017cfc9a8"

let package = Package(
    name: "OnsideKit",
    products: [
        .library(name: "OnsideKit",     targets: ["OnsideKit"]),
        .library(name: "OnsideKitLite", targets: ["OnsideKitLite"])
    ],
    targets: [
        .binaryTarget(name: "OnsideKit",     url: url, checksum: checksum),
        .binaryTarget(name: "OnsideKitLite", url: url, checksum: checksum)
    ]
)
