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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/2.1.0/OnsideKit.xcframework.zip",
            checksum: "215a7476036001b0b87411673543b8664f23d59b07dea969ed52bfffe4abbb0a"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/2.1.0/OnsideKitLite.xcframework.zip",
            checksum: "9e4ae11fc682f4b96710405e7773695cdc86008eda439367b96e6e3c1eccdb8c"
        )
    ]
)
