// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Vkontakter",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(name: "Vkontakter", targets: ["Vkontakter"]),
//        .library(name: "TelegrammerMultipart", targets: ["TelegrammerMultipart"]),
//        .library(name: "TelegrammerCMultipartParser", targets: ["TelegrammerCMultipartParser"]),
//        .executable(name: "EchoBot", targets: ["DemoEchoBot"]),
//        .executable(name: "HelloBot", targets: ["DemoHelloBot"]),
//        .executable(name: "SchedulerBot", targets: ["DemoSchedulerBot"]),
//        .executable(name: "SpellCheckerBot", targets: ["DemoSpellCheckerBot"]),
//        .executable(name: "WebhooksLocally", targets: ["DemoWebhooksLocally"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.2.0"),
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.18.0")
    ],
    targets: [
        .target(
            name: "Vkontakter",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "Logging", package: "swift-log")
                //.target(name: "TelegrammerMultipart")
            ]
        ),
        //.target(name: "TelegrammerCMultipartParser"),
//        .target(
//            name: "TelegrammerMultipart",
//            dependencies: [
//                .product(name: "NIO", package: "swift-nio"),
//                .product(name: "NIOHTTP1", package: "swift-nio"),
//                .target(name: "TelegrammerCMultipartParser")
//            ]
//        ),
//        .target(name: "DemoEchoBot", dependencies: ["Vkontakter"]),
//        .target(name: "DemoHelloBot", dependencies: ["Vkontakter"]),
//        .target(name: "DemoSchedulerBot", dependencies: ["Vkontakter"]),
//        .target(name: "DemoSpellCheckerBot", dependencies: ["Vkontakter"]),
//        .target(name: "DemoWebhooksLocally", dependencies: ["Vkontakter"]),
        //.testTarget(name: "VkontakterTests", dependencies: ["Vkontakter"])
//        .testTarget(name: "TelegrammerMultipartTests", dependencies: ["TelegrammerCMultipartParser"])
    ]
)
