// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnsideKit",
    platforms: [.iOS("17.4")],
    products: [
        .library(name: "OnsideKit",     targets: ["OnsideKit"]),
        .library(name: "OnsideKitLite", targets: ["OnsideKitLite"])
    ],
    targets: [
        .binaryTarget(
            name: "OnsideKit",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/3.0.0/OnsideKit.xcframework.zip",
            checksum: "9ea589c00305ff4f2133c8ba2bf76c41cde8561c085f36e204e0ce4a79669e21"
        ),
        .binaryTarget(
            name: "OnsideKitLite",
            url: "https://github.com/onside-io/OnsideKit-iOS/releases/download/3.0.0/OnsideKitLite.xcframework.zip",
            checksum: "d78e2c5b2944dc18720e1089dc53ca1b7e105a23cffe06b24de78cec3c9371b0"
        )
    ]
)
