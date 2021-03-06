// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий обсуждение в сообществе,

 SeeAlso VK API Reference:
 [Topic](https://vk.com/dev/objects/topic
 */
public struct Topic: Codable {
    /// Идентификатор обсуждения.
    public let id: Int64?
    
    /// Название обсуждения.
    public let title: String?
    
    /// Дата создания обсуждения в Unixtime.
    public let created: String?
    
    /// Идентификатор создателя обсуждения.
    public let createdBy: String?
    
    /// Дата последнего обновления обсуждения в Unixtime.
    public let updated: UInt64?
    
    /// Идентификатор автора последнего комментария в обсуждении.
    public let updatedBy: Int64?
    
    /// Информация о том, закрыто ли обсуждение.
    public enum IsClosed: Int64, Codable {
        /// 0 — не закрыто;
        case ne_zakryto = 0
    
        /// 1 — закрыто.
        case zakryto = 1
    }
    
    public let isClosed: IsClosed?
    
    /// Информация о том, закреплено ли обсуждение наверху списка.
    public enum IsFixed: Int64, Codable {
        /// 0 — не закреплено;
        case ne_zakrepleno = 0
    
        /// 1 — закреплено.
        case zakrepleno = 1
    }
    
    public let isFixed: IsFixed?
    
    /// Число комментариев в обсуждении.
    public let comments: Int64?
    
    /// (для preview = 1). Текст первого комментария в обсуждении.
    public let firstComment: String?
    
    /// (для preview = 2). Текст последнего комментария в обсуждении.
    public let lastComment: String?
    
    public init(id: Int64? = nil, title: String? = nil, created: String? = nil, createdBy: String? = nil, updated: UInt64? = nil, updatedBy: Int64? = nil, isClosed: IsClosed? = nil, isFixed: IsFixed? = nil, comments: Int64? = nil, firstComment: String? = nil, lastComment: String? = nil) {
        self.id = id
        self.title = title
        self.created = created
        self.createdBy = createdBy
        self.updated = updated
        self.updatedBy = updatedBy
        self.isClosed = isClosed
        self.isFixed = isFixed
        self.comments = comments
        self.firstComment = firstComment
        self.lastComment = lastComment
    }

}