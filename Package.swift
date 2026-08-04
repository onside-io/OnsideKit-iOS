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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.2.1/OnsideKit.xcframework.zip",
            checksum: "03d2dd88fcd2a3da344624f50ecfa0af411bbfa4c31443c9cb8db370dc9d07d4"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.2.1/OnsideKitLite.xcframework.zip",
            checksum: "f55ae438d634c22ca3fe2feb8199e5397813f321ed47dc826bf2b17000d58349"
        )
    ]
)
