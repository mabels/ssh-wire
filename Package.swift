// swift-tools-version:5.3
 
import PackageDescription
 
let package = Package(
    name: "SshWire",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "sshwire",
            targets: ["SshWire"]),
    ],
    targets: [
        .binaryTarget(
            name: "SshWire",
            path: "Frameworks/SshWire.xcframework"
        )
    ]
)

