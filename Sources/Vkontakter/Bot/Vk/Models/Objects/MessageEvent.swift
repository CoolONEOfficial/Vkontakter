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

}
