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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.2/OnsideKit.xcframework.zip",
            checksum: "c33c751b2dec3c15ad62938a8f478d76d4bf47ff1586620b90e84b62eb05243a"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.2/OnsideKitLite.xcframework.zip",
            checksum: "04c730725bafc8df906e9703f13a1e645c5726bfc2072698be31760734e175ad"
        )
    ]
)
