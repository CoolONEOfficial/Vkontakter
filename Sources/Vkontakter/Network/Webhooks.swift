//
//  Webhooks.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 28.04.2018.
//

import Foundation
import AsyncHTTPClient
import NIO

/// Will take care of you VK webhooks updates
public class Webhooks: Connection {

    public struct Config {
        public var ip: String
        public var url: String
        public var groupId: UInt64?

        public init(ip: String, url: String, groupId: UInt64? = nil) {
            self.ip = ip
            self.url = url
            self.groupId = groupId
        }
    }

    public var bot: Bot
    public var dispatcher: Dispatcher
    public var worker: Worker
    public var running: Bool

    public var readLatency: TimeAmount = .seconds(2)
    public var clean: Bool = false
    public var maxConnections: Int = 40

    private var server: UpdatesServer?

    public init(bot: Bot, dispatcher: Dispatcher, worker: Worker = MultiThreadedEventLoopGroup(numberOfThreads: 1)) {
        self.bot = bot
        self.dispatcher = dispatcher
        self.worker = worker
        self.running = false
    }

    public func start() throws -> Future<Void> {
        guard let config = bot.settings.webhooksConfig else {
            throw CoreError(
                type: .internal,
                reason: "Initialization parameters wasn't found in enviroment variables"
            )
        }

        return try listenWebhooks(on: config.ip, port: 80)
    }

    private func listenWebhooks(on host: String, port: Int) throws -> Future<Void> {
        let promise = worker.next().makePromise(of: Void.self)
        let server = UpdatesServer(host: host, port: port, handler: dispatcher)
        try server.start()
            .whenComplete { (result) in
                switch result {
                case .success:
                    self.server = server
                    self.running = true
                    log.info("HTTP server started on: \(host):\(port)")
                    promise.succeed(())
                case .failure(let error):
                    log.info("HTTP server failed on: \(host):\(port)")
                    log.error(error.logMessage)
                    promise.fail(error)
                }
        }
        return promise.futureResult
    }

    public func stop() throws -> Future<Void> {
        let promise = worker.next().makePromise(of: Void.self)
        try self.server?.stop()
            .whenSuccess {
                self.running = false
                promise.succeed(())
        }
        return promise.futureResult
    }
}
