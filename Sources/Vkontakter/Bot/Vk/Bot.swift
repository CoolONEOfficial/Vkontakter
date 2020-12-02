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
import SwiftyVK

class VKDelegateExample: SwiftyVKDelegate {

    func vkNeedsScopes(for sessionId: String) -> Scopes {
      // Called when SwiftyVK attempts to get access to user account
      // Should return a set of permission scopes
        return []
    }

    func vkNeedToPresent(viewController: VKViewController) {
      // Called when SwiftyVK wants to present UI (e.g. webView or captcha)
      // Should display given view controller from current top view controller
    }

    func vkTokenCreated(for sessionId: String, info: [String : String]) {
      // Called when user grants access and SwiftyVK gets new session token
      // Can be used to run SwiftyVK requests and save session data
    }

    func vkTokenUpdated(for sessionId: String, info: [String : String]) {
      // Called when existing session token has expired and successfully refreshed
      // You don't need to do anything special here
    }

    func vkTokenRemoved(for sessionId: String) {
      // Called when user was logged out
      // Use this method to cancel all SwiftyVK requests and remove session data
    }
}

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
        
        VK.setUp()
        try VK.sessions.default.logIn(rawToken: "23da22dc51175cd5e2d0e9b91ea3539579b71858caa97b0192480dc81801d48d6b981908457f765540334", expires: nil)
        VK.API.Messages.send([ .peerId: "220373686" ])
            .onSuccess { res in
                debugPrint("SUCCESS \(res)")
            }
            .onError { err in
                debugPrint("ERROR \(err)")
            }
            .send()
    }

    func processContainer<T: Codable>(_ container: VkContainer<T>) throws -> T {
        guard container.ok else {
            let desc = """
            Response marked as `not Ok`, it seems something wrong with request
            Code: \(container.error?.errorCode ?? -1)
            \(container.error?.errorMessage ?? "Empty")
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
        Code: \(container.error?.errorCode ?? 0)
        Status OK: \(container.ok)
        Description: \(container.error?.errorMessage ?? "Empty")

        """
        log.info(logString.logMessage)
        return result
    }

    func httpHeaders(for object: Encodable?) -> HTTPHeaders {
        guard let object = object else { return HTTPHeaders() }

        if object is JSONEncodable {
            return .contentJson
        }

        if object is Encodable { // MultipartEncodable
            fatalError("you forgot JSONEncodable?")
        }

        return .empty
    }
}
