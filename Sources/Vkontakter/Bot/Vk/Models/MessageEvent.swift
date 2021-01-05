//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 21.12.2020.
//

import Foundation
import AnyCodable

public struct MessageEvent: Codable {

    /// идентификатор пользователя
    public let userId: Int64
    
    /// идентификатор диалога со стороны бота
    public let peerId: Int64
    
    /// случайная строка. Активна в течение минуты, спустя минуту становится недействительной
    public let eventId: String
    
    /// дополнительная информация
    public let payload: AnyCodable?
    
    /// идентификатор сообщения в беседе
    public let conversationMessageId: Int64

//    private enum CodingKeys: CodingKey {
//        case userId, peerId, eventId, payload, conversationMessageId
//    }
//
////    public init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        userId = try container.decode(Int64.self, forKey: .userId)
////        peerId = try container.decode(Int64.self, forKey: .peerId)
////        eventId = try container.decode(String.self, forKey: .eventId)
////        let str = try container.decode(String.self, forKey: .payload)
////        payload = .init(nil)
////        conversationMessageId = try container.decode(Int64.self, forKey: .conversationMessageId)
////    }
////
////    public func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: CodingKeys.self)
////        try container.encode(userId, forKey: .userId)
////        try container.encode(peerId, forKey: .peerId)
////        try container.encode(eventId, forKey: .eventId)
////        if let payload = payload {
////            let str = "[\"\(payload.description)\"]"
////            try container.encode(str, forKey: .payload)
////        } else {
////            try container.encodeNil(forKey: .payload)
////        }
////        try container.encode(conversationMessageId, forKey: .conversationMessageId)
////    }
}
