// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

/**
 Список объектов › Приложение 1. Базовые поля 2. Опциональные поля Объект, описывающий приложение, содержит следующие поля:

 SeeAlso VK API Reference:
 [App](https://vk.com/dev/objects/app
 */
public final class App: Codable {
    /// Идентификатор приложения.
    public let id: Int64
    
    /// Название приложения.
    public let title: String
    
    /// Url-адрес обложки приложения шириной 278px.
    public let icon278: String
    
    /// Url-адрес обложки приложения шириной 139px.
    public let icon139: String
    
    /// Url-адрес обложки приложения шириной 150px.
    public let icon150: String
    
    /// Url-адрес обложки приложения шириной 75px.
    public let icon75: String
    
    /// Url-адрес баннера шириной 560px.
    public let banner560: String
    
    /// Url-адрес баннера шириной 1120px.
    public let banner1120: String
    
    /// Тип приложения.
    public enum `Type`: String, Codable {
        case otdelnoe_prilozenie_dla_mobilnogo_ustrojstva = "standalone"
        case podklucaemyj_sajt = "site"
        case socialnoe_prilozenie = "app"
        case igra = "game"
    }
    
    let `type`: Type
    
    /// Категория приложения.
    public let section: String
    
    /// Адрес страницы автора приложения.
    public let authorUrl: String
    
    /// Идентификатор автора приложения.
    public let authorId: Int64
    
    /// Идентификатор официальной группы приложения.
    public let authorGroup: Int64
    
    /// Количество участников приложения.
    public let membersCount: Int64
    
    /// Дата размещения в Unixtime.
    public let publishedDate: UInt64
    
    /// Позиция в каталоге.
    public let catalogPosition: Int64
    
    /// Является ли приложение мультиязычным ().
    public let international: VkFlag
    
    /// Тип турнирной таблицы.
    public enum LeaderboardType: Int64, Codable {
        case po_urovnu = 1
        case ne_podderzivaetsa = 0
        case po_ockam = 2
    }
    
    let leaderboardType: LeaderboardType
    
    /// Идентификатор жанра
    public let genreId: Int64
    
    /// Название жанра
    public let genre: String
    
    /// Идентификатор приложения в магазине приложений
    public let platformId: String
    
    /// Доступно ли приложение в мобильном каталоге.
    public let isInCatalog: VkFlag
    
    /// Список идентификаторов друзей текущего пользователя, которые установили приложение (если был передан параметр = .
    public let friends: [Int64]
    
    /// , если приложение установлено у текущего пользователя.
    public let installed: VkFlag
    
    /// , если приложение — html5 игра.
    public let isHtml5App: Int64
    
    /// Поддерживаемая ориентация экрана.
    public enum ScreenOrientation: Int64, Codable {
        case albomnaa_i_portretnaa = 0
        case tolko_portretnaa = 2
        case tolko_albomnaa = 1
    }
    
    let screenOrientation: ScreenOrientation
    
    /// Тип элементов управления игрой на мобильных устройствах.
    public let mobileControlsType: VkFlag
    
    /// ,
    public let mobileViewSupportType: VkFlag
    
    /// Описание.
    public let description: String?
    
    /// Короткий адрес приложения (или строка , если короткий адрес не задан).
    public let screenName: String?
    
    /// Url-адрес обложки приложения шириной 16px.
    public let icon16: String?
    
    /// Массив объектов , описывающих скриншоты приложения.
    public final class Screenshots: Codable {
        
        
        public init() {
        }
    }
    
    let screenshots: Screenshots?
    
    /// , если у пользователя включены уведомления из этого приложения.
    public let pushEnabled: VkFlag?
    
    public init(id: Int64, title: String, icon278: String, icon139: String, icon150: String, icon75: String, banner560: String, banner1120: String, type: Type, section: String, authorUrl: String, authorId: Int64, authorGroup: Int64, membersCount: Int64, publishedDate: UInt64, catalogPosition: Int64, international: VkFlag, leaderboardType: LeaderboardType, genreId: Int64, genre: String, platformId: String, isInCatalog: VkFlag, friends: [Int64], installed: VkFlag, isHtml5App: Int64, screenOrientation: ScreenOrientation, mobileControlsType: VkFlag, mobileViewSupportType: VkFlag, description: String? = nil, screenName: String? = nil, icon16: String? = nil, screenshots: Screenshots? = nil, pushEnabled: VkFlag? = nil) {
        self.id = id
        self.title = title
        self.icon278 = icon278
        self.icon139 = icon139
        self.icon150 = icon150
        self.icon75 = icon75
        self.banner560 = banner560
        self.banner1120 = banner1120
        self.type = `type`
        self.section = section
        self.authorUrl = authorUrl
        self.authorId = authorId
        self.authorGroup = authorGroup
        self.membersCount = membersCount
        self.publishedDate = publishedDate
        self.catalogPosition = catalogPosition
        self.international = international
        self.leaderboardType = leaderboardType
        self.genreId = genreId
        self.genre = genre
        self.platformId = platformId
        self.isInCatalog = isInCatalog
        self.friends = friends
        self.installed = installed
        self.isHtml5App = isHtml5App
        self.screenOrientation = screenOrientation
        self.mobileControlsType = mobileControlsType
        self.mobileViewSupportType = mobileViewSupportType
        self.description = description
        self.screenName = screenName
        self.icon16 = icon16
        self.screenshots = screenshots
        self.pushEnabled = pushEnabled
    }

}