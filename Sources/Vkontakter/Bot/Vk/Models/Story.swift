// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий историю,

 SeeAlso VK API Reference:
 [Story](https://vk.com/dev/objects/story
 */
public struct Story: Codable {
    /// Идентификатор истории.
    public let id: Int64?
    
    /// Идентификатор владельца истории.
    public let ownerId: Int64?
    
    /// Дата добавления в Unixtime.
    public let date: UInt64?
    
    /// Дата в Unixtime, когда история истечёт.
    public let expiresAt: UInt64?
    
    /// True, если срок хранения истории истёк. В этом случае объект истории содержит только поля id, owner_id, date, expires_at, is_expired.
    public struct IsExpired: Codable {
        
        
        public init() {
        }
    }
    
    public let isExpired: IsExpired?
    
    /// True, если история удалена или не существует. В этом случае объект истории содержит только поля id, owner_id, is_deleted.
    public struct IsDeleted: Codable {
        
        
        public init() {
        }
    }
    
    public let isDeleted: IsDeleted?
    
    /// Информация о том, может ли пользователь просмотреть историю (0 — нет, 1 — да). Если can_see = 0, объект истории содержит только поля id, owner_id, date, expires_at, can_see, type.
    public let canSee: VkFlag?
    
    /// 1, если история просмотрена текущим пользователем.
    public let seen: Int64?
    
    /// Тип истории.
    public enum `Type`: String, Codable {
        /// photo — фотография;
        case photo
    
        /// video — видеозапись.
        case video
    }
    
    public let `type`: Type?
    
    /// (для type = photo). Фотография из истории. Поля объекта описаны на отдельной странице.
    public struct Photo: Codable {
        
        
        public init() {
        }
    }
    
    public let photo: Photo?
    
    /// (для type = video). Видео из истории. Поля объекта описаны на отдельной странице. Содержит дополнительные поля first_frame_800, first_frame_320, first_frame_160, first_frame_130 (string), содержащие URL изображения-первого кадра видео с соответствующей шириной, и поле is_private (integer, [0,1]) — информация о том, приватная ли история (0 — нет, 1 — да).
    public let video: VkFlag?
    
    /// Ссылка для перехода из истории.
    public struct Link: Codable {
        
        /// Текст ссылки.
        public let text: String?
        
        /// URL для перехода.
        public let url: String?
        
        public init(text: String? = nil, url: String? = nil) {
            self.text = text
            self.url = url
        }
    }
    
    public let link: Link?
    
    /// Идентификатор пользователя, загрузившего историю, ответом на которую является текущая.
    public let parentStoryOwnerId: Int64?
    
    /// Идентификатор истории, ответом на которую является текущая.
    public let parentStoryId: Int64?
    
    /// Объект родительской истории.
    public struct ParentStory: Codable {
        
        
        public init() {
        }
    }
    
    public let parentStory: ParentStory?
    
    /// Информация об ответах на текущую историю. Объект, который содержит поля: Получить истории-ответы можно методом .
    public struct Replies: Codable {
        
        /// Число ответов.
        public let count: Int64?
        
        /// Число новых ответов. Возвращается только для историй текущего пользователя.
        public let new: Int64?
        
        public init(count: Int64? = nil, new: Int64? = nil) {
            self.count = count
            self.new = new
        }
    }
    
    public let replies: Replies?
    
    /// Информация о том, может ли пользователь ответить на историю (0 — нет, 1 — да).
    public let canReply: VkFlag?
    
    /// Информация о том, может ли пользователь расшарить историю (0 — нет, 1 — да).
    public let canShare: VkFlag?
    
    /// Информация о том, может ли пользователь комментировать историю (0 — нет, 1 — да).
    public let canComment: VkFlag?
    
    /// Объект кликабельного стикера.
    public struct ClickableStickers: Codable {
        
        
        public init() {
        }
    }
    
    public let clickableStickers: ClickableStickers?
    
    /// Число просмотров.
    public let views: Int64?
    
    /// Ключ доступа для приватного объекта.
    public struct AccessKey: Codable {
        
        
        public init() {
        }
    }
    
    public let accessKey: AccessKey?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, date: UInt64? = nil, expiresAt: UInt64? = nil, isExpired: IsExpired? = nil, isDeleted: IsDeleted? = nil, canSee: VkFlag? = nil, seen: Int64? = nil, type: Type? = nil, photo: Photo? = nil, video: VkFlag? = nil, link: Link? = nil, parentStoryOwnerId: Int64? = nil, parentStoryId: Int64? = nil, parentStory: ParentStory? = nil, replies: Replies? = nil, canReply: VkFlag? = nil, canShare: VkFlag? = nil, canComment: VkFlag? = nil, clickableStickers: ClickableStickers? = nil, views: Int64? = nil, accessKey: AccessKey? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.date = date
        self.expiresAt = expiresAt
        self.isExpired = isExpired
        self.isDeleted = isDeleted
        self.canSee = canSee
        self.seen = seen
        self.type = `type`
        self.photo = photo
        self.video = video
        self.link = link
        self.parentStoryOwnerId = parentStoryOwnerId
        self.parentStoryId = parentStoryId
        self.parentStory = parentStory
        self.replies = replies
        self.canReply = canReply
        self.canShare = canShare
        self.canComment = canComment
        self.clickableStickers = clickableStickers
        self.views = views
        self.accessKey = accessKey
    }

}