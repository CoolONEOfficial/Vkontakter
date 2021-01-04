// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Список объектов › Фотография Объект, описывающий фотографию, содержит следующие поля: id integer идентификатор фотографии. album_id integer идентификатор альбома, в котором находится фотография. owner_id integer идентификатор владельца фотографии. user_id integer идентификатор пользователя, загрузившего фото (если фотография размещена в сообществе). Для фотографий, размещенных от имени сообщества, user_id = 100. text string текст описания фотографии. date integer дата добавления в формате Unixtime. sizes array массив с копиями изображения в разных размерах. Каждый объект массива содержит следующие поля: type (string) — тип копии. См. Формат описания размеров фотографии. url (string) — URL копии. width (integer) — высота в px. height (integer) — ширина в px. width* integer ширина оригинала фотографии в пикселах. height* integer высота оригинала фотографии в пикселах.

 SeeAlso VK API Reference:
 [Photo](https://vk.com/dev/objects/photo
 */
public final class Photo: Codable {
    /// Идентификатор фотографии.
    public let id: Int64?
    
    /// Идентификатор альбома, в котором находится фотография.
    public let albumId: Int64?
    
    /// Идентификатор владельца фотографии.
    public let ownerId: Int64?
    
    /// Идентификатор пользователя, загрузившего фото (если фотография размещена в сообществе). Для фотографий, размещенных от имени сообщества, user_id = 100.
    public let userId: Int64?
    
    /// Текст описания фотографии.
    public let text: String?
    
    /// Дата добавления в формате Unixtime.
    public let date: UInt64?
    
    /// Массив с копиями изображения в разных размерах.
    public final class Sizes: Codable {
        
        /// Тип копии. См. Формат описания размеров фотографии.
        public let `type`: String?
        
        /// URL копии.
        public let url: String?
        
        /// Высота в px.
        public let width: Int64?
        
        /// Ширина в px.
        public let height: Int64?
        
        public init(type: String? = nil, url: String? = nil, width: Int64? = nil, height: Int64? = nil) {
            self.type = `type`
            self.url = url
            self.width = width
            self.height = height
        }
    }
    
    public let sizes: [Sizes]?
    
    /// Ширина оригинала фотографии в пикселах.
    public let width: Int64?
    
    /// Высота оригинала фотографии в пикселах.
    public let height: Int64?
    
    public init(id: Int64? = nil, albumId: Int64? = nil, ownerId: Int64? = nil, userId: Int64? = nil, text: String? = nil, date: UInt64? = nil, sizes: [Sizes]? = nil, width: Int64? = nil, height: Int64? = nil) {
        self.id = id
        self.albumId = albumId
        self.ownerId = ownerId
        self.userId = userId
        self.text = text
        self.date = date
        self.sizes = sizes
        self.width = width
        self.height = height
    }

}