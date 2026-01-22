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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/0.3.0/OnsideKit.xcframework.zip",
            checksum: "0adc1756082a7e52c50661e75dd1cb6358c6f8ced49523f67fbaca731d75a707"
        )
    ]
)
