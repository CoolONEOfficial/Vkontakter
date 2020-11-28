//
//  Bot.swift
//  Telegrammer
//
//  Created by Givi on 15/03/2019.
//

import Foundation
import Logging
import NIO
import NIOHTTP1
import AsyncHTTPClient

//TODO: Implement our own LogHandler
let log = Logger(label: "com.gp-apps.vkontakter")

public typealias Worker = EventLoopGroup

public final class Bot: BotProtocol {

    /// Bot parameters container for initial setup, also contains Webhoos seetings
    public struct Settings {
        public let token: String
        public let debugMode: Bool
        public var serverHost: String = "api.vk.com"
        public var webhooksConfig: Webhooks.Config?
        public var proxy: Bot.Settings.Proxy?

        public init(token: String, debugMode: Bool = true) {
            self.token = token
            self.debugMode = debugMode
        }
    }

    /// HTTP client for bot
    public let client: BotClient

    /// Bot parameters container
    public let settings: Settings

    let boundary: String
    let clientWorker: MultiThreadedEventLoopGroup

    // Vk Callback API server confirmationCode
    public var confirmationCode: String?
    
    // Vk Callback API secret key
    private var secretKey: String?
    
    public func checkSecretKey(with key: String) -> Bool {
        secretKey != nil ? key == secretKey : true
    }
    
    public func setSecretKey(_ secretKey: String) {
        self.secretKey = secretKey
    }

    public convenience init(token: String) throws {
        try self.init(settings: Bot.Settings(token: token))
    }

    public init(settings: Settings, numThreads: Int = System.coreCount) throws {
        self.settings = settings
        self.clientWorker = MultiThreadedEventLoopGroup(numberOfThreads: numThreads)
        let groupProvider = HTTPClient.EventLoopGroupProvider.shared(self.clientWorker)
        let proxy = settings.proxy.map(HTTPClient.Configuration.Proxy.init)
        self.client = try BotClient(
            host: settings.serverHost,
            token: settings.token,
            worker: groupProvider,
            proxy: proxy
        )
        self.boundary = String.random(ofLength: 20)
    }

    func processContainer<T: Codable>(_ container: VkContainer<T>) throws -> T {
        guard container.ok else {
            let desc = """
            Response marked as `not Ok`, it seems something wrong with request
            Code: \(container.error?.code ?? -1)
            \(container.error?.message ?? "Empty")
            """
            let error = CoreError(
                type: .server,
                description: desc
            )
            log.error(error.logMessage)
            throw error
        }

        guard let result = container.response else {
            let error = CoreError(
                type: .server,
                reason: "Response marked as `Ok`, but doesn't contain `result` field."
            )
            log.error(error.logMessage)
            throw error
        }

        let logString = """

        Response:
        Code: \(container.error?.code ?? 0)
        Status OK: \(container.ok)
        Description: \(container.error?.message ?? "Empty")

        """
        log.info(logString.logMessage)
        return result
    }

//    func httpBody(for object: Encodable?) throws -> HTTPClient.Body? {
//        guard let object = object else {
//            return nil
//        }
//
//        if let object = object as? JSONEncodable {
//            return .data(try object.encodeBody())
//        }
//
////        if let object = object as? Encodable { // MultipartEncodable
////            return .byteBuffer(try object.encodeBody(boundary: boundary))
////        }
//
//        return nil
//    }

    func httpHeaders(for object: Encodable?) -> HTTPHeaders {
        guard let object = object else { return HTTPHeaders() }

        if object is JSONEncodable {
            return .contentJson
        }

        if object is Encodable { // MultipartEncodable
            fatalError("you forgot JSONEncodable?")
            //return .typeFormData(boundary: boundary)
        }

        return .empty
    }
}
