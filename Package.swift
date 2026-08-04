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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.2.0/OnsideKit.xcframework.zip",
            checksum: "f60ecb7908e367d9b72e7cbacff9e5f0cbfde9827770c808a65c811937953c69"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.2.0/OnsideKitLite.xcframework.zip",
            checksum: "b0a7ea4ff0c781a130b7ab5d4bc83b100336525368a344c758ba6d8738e49d4e"
        )
    ]
)
