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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.3/OnsideKit.xcframework.zip",
            checksum: "80abcedf00de06b715fadec8710b10f90e28e507f7eeb893d4fc240e6121b845"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.3/OnsideKitLite.xcframework.zip",
            checksum: "0dc89b9905b233caad80a93fdd7eaeb2e80e3e1eeacca2994aefbf617d85d711"
        )
    ]
)
