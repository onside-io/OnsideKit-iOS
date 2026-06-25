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
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.1/OnsideKit.xcframework.zip",
            checksum: "94adae93ac04d1acbd079fac34c16a969e5aeaf4805e2510f38fb21f51eafab1"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/1.0.1/OnsideKitLite.xcframework.zip",
            checksum: "d66f90b83e70f53a00f51f9c5a968dbc4df156e7623cd0029f79868066c35b10"
        )
    ]
)
