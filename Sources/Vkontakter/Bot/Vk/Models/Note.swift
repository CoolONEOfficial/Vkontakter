// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий заметку,

 SeeAlso VK API Reference:
 [Note](https://vk.com/dev/objects/note
 */
public struct Note: Codable {
    /// Идентификатор заметки.
    public let id: Int64?
    
    /// Идентификатор владельца заметки.
    public let ownerId: Int64?
    
    /// Заголовок заметки.
    public let title: String?
    
    /// Текст заметки.
    public let text: String?
    
    /// Дата создания заметки в формате Unixtime.
    public let date: UInt64?
    
    /// Количество комментариев.
    public let comments: Int64?
    
    /// Количество прочитанных комментариев (только при запросе информации о заметке текущего пользователя).
    public let readComments: Int64?
    
    /// URL страницы для отображения заметки.
    public let viewUrl: String?
    
    /// При получении объектов, прямого доступа к которым может не быть, например, фотографий или видео в новостях, вместе с объектами приходит поле access_key, которое необходимо передавать при получении этих объектов напрямую или при совершении с ними действий. 
    public let accessKey: String?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, title: String? = nil, text: String? = nil, date: UInt64? = nil, comments: Int64? = nil, readComments: Int64? = nil, viewUrl: String? = nil, accessKey: String? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.title = title
        self.text = text
        self.date = date
        self.comments = comments
        self.readComments = readComments
        self.viewUrl = viewUrl
        self.accessKey = accessKey
    }

}