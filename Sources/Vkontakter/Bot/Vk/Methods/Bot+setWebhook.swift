//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 26.12.2020.
//

import Foundation
import Logging
import NIO
import NIOHTTP1
import AsyncHTTPClient

public extension Bot {
    private func updateConfirmationCode(_ groupId: UInt64) throws -> EventLoopFuture<Bot.GetCallbackConfirmationCodeResp> {
        try getCallbackConfirmationCode(params: .init(groupId: groupId)).flatMapThrowing { resp in
            self.confirmationCode = resp.code
            return resp
        }
    }
    
    private func createServer(_ groupId: UInt64, _ serverUrl: String, serverName: String?, secretKey: String) throws -> EventLoopFuture<Bot.AddCallbackServerResp> {
        var serverName = serverName
        if serverName == nil {
            log.debug("Enter name for new VK callback API server: ")
            serverName = readLine()!
        }

        return try addCallbackServer(params: .init(
            groupId: groupId, url: serverUrl,
            title: serverName!, secretKey: secretKey
        ))
    }
    
    private func setServerSettings(_ groupId: UInt64, _ serverUrl: String, _ serverId: UInt64) throws -> EventLoopFuture<VkFlag> {
        try setCallbackSettings(params: .init(
            groupId: groupId, serverId: serverId,
            apiVersion: "5.126",
            messageNew: .on,
            messageEvent: .on
        ))
    }
    
    func setWebhook(serverName: String?) throws -> EventLoopFuture<Void> {
        guard let config = settings.webhooksConfig,
              let groupId = config.groupId else {
            throw CoreError(
                type: .internal,
                reason: "Initialization parameters (with groupId) wasn't found in enviroment variables"
            )
        }

        return try getCallbackServers(params: .init(groupId: groupId))
            .flatMapThrowing { try self.handleCallbackServers($0, config, groupId, serverName) }
    }

    enum CallbackError: Error {
        case setServerSettings
    }
    
    private func handleCallbackServers(_ serversResp: GetCallbackServersResp, _ config: Webhooks.Config, _ groupId: UInt64, _ serverName: String?) throws -> EventLoopFuture<Bool>? {
        let servers = serversResp.items
        let serverUrl = config.url
        
        let allSteps: (() throws -> EventLoopFuture<Bool>) = {
            try self.updateConfirmationCode(groupId)
                .flatMap { resp -> EventLoopFuture<Bool> in
                    let secretKey: String = .random(ofLength: 15)

                    return try! self.createServer(groupId, serverUrl, serverName: serverName, secretKey: secretKey)
                        .flatMap { resp -> EventLoopFuture<Bool> in
                            self.setSecretKey(secretKey)
                            return try! self.setServerSettings(groupId, serverUrl, resp.serverId).map { $0.bool }
                        }
                }
        }

        if let matchServer = servers.first(where: { $0.url == serverUrl }) {
            if matchServer.status != .ok {
                debugPrint("Server founded but status is \(matchServer.status!.rawValue) on Callback API")
                return try deleteCallbackServer(params: .init(groupId: groupId, serverId: matchServer.id!)).flatMap { _ in
                        try! allSteps()
                    }
            } else {
                setSecretKey(matchServer.secretKey!)
                debugPrint("Server already configured on Callback API")
                return nil
            }
        } else {
            debugPrint("Server not found on Callback API")
            return try allSteps()
        }
    }

}
