// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

/**
 Объект, описывающий товар,

 SeeAlso VK API Reference:
 [MarketItem](https://vk.com/dev/objects/market_item
 */
public final class MarketItem: Codable {
    /// Идентификатор товара.
    public let id: Int64?
    
    /// Идентификатор владельца товара.
    public let ownerId: Int64?
    
    /// Название товара
    public let title: String?
    
    /// Текст описания товара.
    public let description: String?
    
    /// Цена.
    public final class Price: Codable {
        
        /// Цена товара в сотых долях единицы валюты.
        public let amount: String?
        
        /// Валюта. Объект, содержащий поля: id (integer) — идентификатор валюты. name(string) — обозначение валюты.
        public final class Currency: Codable {
            
            /// Идентификатор валюты.
            public let id: Int64?
            
            /// Обозначение валюты.
            public let name: String?
            
            public init(id: Int64? = nil, name: String? = nil) {
                self.id = id
                self.name = name
            }
        }
        
        public let currency: Currency?
        
        public init(amount: String? = nil, currency: Currency? = nil) {
            self.amount = amount
            self.currency = currency
        }
    }
    
    public let price: Price?
    
    /// Габариты товара.
    public final class Dimensions: Codable {
        
        /// Ширина в миллиметрах.
        public let width: Int64?
        
        /// Высота в миллиметрах.
        public let height: Int64?
        
        /// Длина в миллиметрах.
        public let length: Int64?
        
        public init(width: Int64? = nil, height: Int64? = nil, length: Int64? = nil) {
            self.width = width
            self.height = height
            self.length = length
        }
    }
    
    public let dimensions: Dimensions?
    
    /// Вес в граммах.
    public let weight: Int64?
    
    /// Категория товара.
    public final class Category: Codable {
        
        /// Идентификатор категории.
        public let id: Int64?
        
        /// Название категории.
        public let name: String?
        
        /// Секция. Объект, содержащий поля: id (integer) — идентификатор секции. name (string) — название секции.
        public final class Section: Codable {
            
            /// Идентификатор секции.
            public let id: Int64?
            
            /// Название секции.
            public let name: String?
            
            public init(id: Int64? = nil, name: String? = nil) {
                self.id = id
                self.name = name
            }
        }
        
        public let section: Section?
        
        public init(id: Int64? = nil, name: String? = nil, section: Section? = nil) {
            self.id = id
            self.name = name
            self.section = section
        }
    }
    
    public let category: Category?
    
    /// URL изображения-обложки товара.
    public let thumbPhoto: String?
    
    /// Дата создания товара в формате Unixtime.
    public let date: UInt64?
    
    /// Статус доступности товара.
    public enum Availability: Int64, Codable {
        case tovar_udalen = 1
        case tovar_dostupen = 0
        case tovar_nedostupen = 2
    }
    
    public let availability: Availability?
    
    /// , если объект добавлен в закладки у текущего пользователя.
    public final class IsFavorite: Codable {
        
        
        public init() {
        }
    }
    
    public let isFavorite: IsFavorite?
    
    /// Артикул товара,
    public let sku: String?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, title: String? = nil, description: String? = nil, price: Price? = nil, dimensions: Dimensions? = nil, weight: Int64? = nil, category: Category? = nil, thumbPhoto: String? = nil, date: UInt64? = nil, availability: Availability? = nil, isFavorite: IsFavorite? = nil, sku: String? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.title = title
        self.description = description
        self.price = price
        self.dimensions = dimensions
        self.weight = weight
        self.category = category
        self.thumbPhoto = thumbPhoto
        self.date = date
        self.availability = availability
        self.isFavorite = isFavorite
        self.sku = sku
    }

}