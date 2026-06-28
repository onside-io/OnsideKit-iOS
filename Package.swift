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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.1.0/OnsideKit.xcframework.zip",
            checksum: "45139750d0fdfdfa8ce75bec2fa4c403283f096942a46fcd852682082112e6f7"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.1.0/OnsideKitLite.xcframework.zip",
            checksum: "5fca1eafca550519aeaa18280ab30feeef5658bbb9b77d457e780c0c6fbb918a"
        )
    ]
)
