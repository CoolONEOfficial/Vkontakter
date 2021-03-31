// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Vkontakter",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(name: "Vkontakter", targets: ["Vkontakter"]),
        .library(name: "VkontakterMultipart", targets: ["VkontakterMultipart"]),
        .library(name: "VkontakterCMultipartParser", targets: ["VkontakterCMultipartParser"]),
        .executable(name: "API generate", targets: ["API"]),
        .executable(name: "Vkontakter EchoBot", targets: ["VkontakterDemoEchoBot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.2.0"),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.18.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.3.2"),
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.4.0"),
    ],
    targets: [
        .target(
            name: "Vkontakter",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "AnyCodable", package: "AnyCodable"),
                .target(name: "VkontakterMultipart"),
            ]
        ),
        .target(name: "VkontakterCMultipartParser"),
        .target(
            name: "VkontakterMultipart",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOHTTP1", package: "swift-nio"),
                .target(name: "VkontakterCMultipartParser"),
            ]
        ),
        .target(name: "API", dependencies: ["SwiftSoup"]),
        .target(name: "VkontakterDemoEchoBot", dependencies: ["Vkontakter"]),
    ]
)
