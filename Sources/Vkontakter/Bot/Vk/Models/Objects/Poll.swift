// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

/**
 Объект, описывающий опрос,

 SeeAlso VK API Reference:
 [Poll](https://vk.com/dev/objects/poll
 */
public final class Poll: Codable {
    /// Идентификатор опроса для получения информации о нем через метод .
    public let id: Int64?
    
    /// Идентификатор владельца опроса.
    public let ownerId: Int64?
    
    /// Дата создания в формате Unixtime.
    public let created: UInt64?
    
    /// Текст вопроса.
    public let question: String?
    
    /// Количество голосов.
    public let votes: Int64?
    
    /// Массив объектов, которые содержат информацию о вариантах ответа.
    public final class Answers: Codable {
        
        /// Идентификатор ответа.
        public let id: Int64?
        
        /// Текст ответа.
        public let text: String?
        
        /// Число проголосовавших за этот ответ.
        public let votes: Int64?
        
        /// Рейтинг ответа.
        public let rate: Int64?
        
        public init(id: Int64? = nil, text: String? = nil, votes: Int64? = nil, rate: Int64? = nil) {
            self.id = id
            self.text = text
            self.votes = votes
            self.rate = rate
        }
    }
    
    let answers: Answers?
    
    /// Является ли опрос анонимным.
    public let anonymous: Bool?
    
    /// Допускает ли опрос выбор нескольких вариантов ответа.
    public let multiple: Bool?
    
    /// Идентификаторы вариантов ответа, выбранных текущим пользователем.
    public let answerIds: [Int64]?
    
    /// Дата завершения опроса в Unixtime. , если опрос бессрочный.
    public let endDate: UInt64?
    
    /// Является ли опрос завершенным.
    public let closed: Bool?
    
    /// Прикреплён ли опрос к обсуждению.
    public let isBoard: Bool?
    
    /// Можно ли отредактировать опрос.
    public let canEdit: Bool?
    
    /// Можно ли проголосовать в опросе.
    public let canVote: Bool?
    
    /// Можно ли пожаловаться на опрос.
    public let canReport: Bool?
    
    /// Можно ли поделиться опросом.
    public let canShare: Bool?
    
    /// Идентификатор автора опроса.
    public let authorId: Int64?
    
    /// Фотография — фон сниппета опроса. Объект .
    public final class Photo: Codable {
        
        
        public init() {
        }
    }
    
    let photo: Photo?
    
    /// Фон сниппета опроса.
    public final class Background: Codable {
        
        /// Идентификатор фона.
        public let id: Int64?
        
        /// Тип фона. Возможные значения: gradient, tile.
        public enum `Type`: String, Codable {
            case gradient
            case tile
        }
        
        let `type`: Type?
        
        /// (для type = gradient) угол градиента по оси X.
        public let angle: Int64?
        
        /// HEX-код замещающего цвета (без #).
        public let color: String?
        
        /// (для type = tile) ширина плитки паттерна.
        public let width: Int64?
        
        /// (для type = tile) высота плитки паттерна.
        public let height: Int64?
        
        /// (для type = tile) изображение плитки паттерна. Массив объектов изображений.
        public final class Images: Codable {
            
            
            public init() {
            }
        }
        
        let images: Images?
        
        /// (для type = gradient) точки градиента. Массив объектов, каждый из которых содержит поля position (number) — положение точки — и color (string) — HEX-код цвета точки.
        public final class Points: Codable {
            
            
            public init() {
            }
        }
        
        let points: Points?
        
        public init(id: Int64? = nil, type: Type? = nil, angle: Int64? = nil, color: String? = nil, width: Int64? = nil, height: Int64? = nil, images: Images? = nil, points: Points? = nil) {
            self.id = id
            self.type = `type`
            self.angle = angle
            self.color = color
            self.width = width
            self.height = height
            self.images = images
            self.points = points
        }
    }
    
    let background: Background?
    
    /// Идентификаторы 3 друзей, которые проголосовали в опросе.
    public let friends: [Int64]?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, created: UInt64? = nil, question: String? = nil, votes: Int64? = nil, answers: Answers? = nil, anonymous: Bool? = nil, multiple: Bool? = nil, answerIds: [Int64]? = nil, endDate: UInt64? = nil, closed: Bool? = nil, isBoard: Bool? = nil, canEdit: Bool? = nil, canVote: Bool? = nil, canReport: Bool? = nil, canShare: Bool? = nil, authorId: Int64? = nil, photo: Photo? = nil, background: Background? = nil, friends: [Int64]? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.created = created
        self.question = question
        self.votes = votes
        self.answers = answers
        self.anonymous = anonymous
        self.multiple = multiple
        self.answerIds = answerIds
        self.endDate = endDate
        self.closed = closed
        self.isBoard = isBoard
        self.canEdit = canEdit
        self.canVote = canVote
        self.canReport = canReport
        self.canShare = canShare
        self.authorId = authorId
        self.photo = photo
        self.background = background
        self.friends = friends
    }

}