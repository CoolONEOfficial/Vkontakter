// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий граффити,

 SeeAlso VK API Reference:
 [Graffiti](https://vk.com/dev/objects/graffiti
 */
public final class Graffiti: Codable {
    /// Идентификатор граффити.
    public let id: Int64?
    
    /// Идентификатор пользователя, загрузившего графити.
    public let ownerId: Int64?
    
    /// Адрес граффити, по которому его можно загрузить.
    public let url: String?
    
    /// Ширина изображения в px.
    public let width: Int64?
    
    /// Высота изображения в px.
    public let height: Int64?
    
    /// При получении объектов, прямого доступа к которым может не быть, например, фотографий или видео в новостях, вместе с объектами приходит поле access_key, которое необходимо передавать при получении этих объектов напрямую или при совершении с ними действий. 
    public let accessKey: String?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, url: String? = nil, width: Int64? = nil, height: Int64? = nil, accessKey: String? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.url = url
        self.width = width
        self.height = height
        self.accessKey = accessKey
    }

}