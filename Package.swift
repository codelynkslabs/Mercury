// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mercury",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Mercury",
            targets: ["Mercury"]),
    ],
    targets: [
        .target(
            name: "Mercury"),
        .testTarget(
            name: "MercuryTests",
            dependencies: ["Mercury"]),
    ]
)
