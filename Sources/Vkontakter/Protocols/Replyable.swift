//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 07.01.2021.
//

import Foundation

public protocol Replyable {
    var fromId: Int64? { get }
}

extension Message: Replyable {}

extension MessageEvent: Replyable {
    public var fromId: Int64? {
        userId
    }
}

public extension Replyable {
    func reply(from bot: Bot, params: Bot.SendMessageParams) throws -> Future<Bot.SendMessageResp> {
        var params = params
        params.peerId = fromId
        return try bot.sendMessage(params: params)
    }
}
