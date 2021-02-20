//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 20.02.2021.
//

import Foundation

public extension Bot {
    
    enum SendMessageResp: Codable {
    
        public struct Item: Codable {
            
            /// Идентификатор назначения.
            public var peerId: Int64?
            
            /// Идентификатор сообщения.
            public let messageId: Int64?
            
            /// Идентификатор сообщения в диалоге.
            public let conversationMessageId: Int64?
            
            /// Сообщение об ошибке, если сообщение не было доставлено получателю.
            public let error: String?
            
            public init(peerId: Int64? = nil, messageId: Int64? = nil, conversationMessageId: Int64? = nil, error: String? = nil) {
                self.peerId = peerId
                self.messageId = messageId
                self.conversationMessageId = conversationMessageId
                self.error = error
            }
        }
        
        case items([Item])
        case id(Int64)
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            
            if let id = try? container.decode(Int64.self) {
                self = .id(id)
            } else {
                self = .items(try container.decode([Item].self))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            
            switch self {
            case let .id(id):
                try container.encode(id)

            case let .items(items):
                try container.encode(items)
            }
        }
    }

}
