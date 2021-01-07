// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий геометку,

 SeeAlso VK API Reference:
 [Geo](https://vk.com/dev/objects/geo
 */
public struct Geo: Codable {
    /// Тип места.
    public let `type`: String?
    
    /// Координаты места.
    public struct Coordinates: Codable {
        
        /// Географическая широта.
        public let latitude: Int64?
        
        /// Географическая долгота.
        public let longitude: Int64?
        
        public init(latitude: Int64? = nil, longitude: Int64? = nil) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
    
    public let coordinates: Coordinates?
    
    /// Описание места (если оно добавлено), объект с полями: Если место добавлено как чекин в сообщество,
    public struct Place: Codable {
        
        /// Идентификатор места (если назначено).
        public let id: Int64?
        
        /// Название места (если назначено).
        public let title: String?
        
        /// Географическая широта.
        public let latitude: Int64?
        
        /// Географическая долгота.
        public let longitude: Int64?
        
        /// Дата создания (если назначено).
        public let created: String?
        
        /// URL изображения-иконки.
        public let icon: String?
        
        /// Название страны.
        public let country: String?
        
        /// Название города.
        public let city: String?
        
        public init(id: Int64? = nil, title: String? = nil, latitude: Int64? = nil, longitude: Int64? = nil, created: String? = nil, icon: String? = nil, country: String? = nil, city: String? = nil) {
            self.id = id
            self.title = title
            self.latitude = latitude
            self.longitude = longitude
            self.created = created
            self.icon = icon
            self.country = country
            self.city = city
        }
    }
    
    public let place: Place?
    
    public init(type: String? = nil, coordinates: Coordinates? = nil, place: Place? = nil) {
        self.type = `type`
        self.coordinates = coordinates
        self.place = place
    }

}