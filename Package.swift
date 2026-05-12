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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.8.1/OnsideKit.xcframework.zip",
            checksum: "e01d8aac8b6298dd79df65863f1984350a0334b8936e2eea87c85144d068f644"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.8.1/OnsideKitLite.xcframework.zip",
            checksum: "0705e1ad97b7ed23687d0cb106e979acbb71ec3f24df3a39c0d536bc6a960c49"
        )
    ]
)
