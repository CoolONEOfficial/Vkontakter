// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий чат,

 SeeAlso VK API Reference:
 [Chat](https://vk.com/dev/objects/chat
 */
public struct Chat: Codable {
    /// Идентификатор беседы.
    public let id: Int64?
    
    /// Тип диалога.
    public let `type`: String?
    
    /// Название беседы.
    public let title: String?
    
    /// Идентификатор пользователя, который является создателем беседы.
    public let adminId: Int64?
    
    /// Список идентификаторов (integer) участников беседы.
    public let users: [Int64]?
    
    /// Настройки оповещений для диалога.
    public struct PushSettings: Codable {
        
        /// Указывает, включен ли звук оповещений (1 — включен, 0 — отключен).
        public let sound: VkFlag?
        
        /// Указывает, до какого времени оповещения для чата отключены. -1 — отключены навсегда (бессрочно).
        public let disabledUntil: Int64?
        
        public init(sound: VkFlag? = nil, disabledUntil: Int64? = nil) {
            self.sound = sound
            self.disabledUntil = disabledUntil
        }
    }
    
    public let pushSettings: PushSettings?
    
    /// URL изображения-обложки чата шириной 50 px (если доступно).
    public let photo50: String?
    
    /// URL изображения-обложки чата шириной 200 px (если доступно).
    public let photo100: String?
    
    /// URL изображения-обложки чата шириной 200 px (если доступно).
    public let photo200: String?
    
    /// Флаг, указывающий, что пользователь покинул беседу. Всегда содержит 1.
    public let left: VkFlag?
    
    /// Флаг, указывающий, что пользователь был исключен из беседы. Всегда содержит 1.
    public let kicked: VkFlag?
    
    public init(id: Int64? = nil, type: String? = nil, title: String? = nil, adminId: Int64? = nil, users: [Int64]? = nil, pushSettings: PushSettings? = nil, photo50: String? = nil, photo100: String? = nil, photo200: String? = nil, left: VkFlag? = nil, kicked: VkFlag? = nil) {
        self.id = id
        self.type = `type`
        self.title = title
        self.adminId = adminId
        self.users = users
        self.pushSettings = pushSettings
        self.photo50 = photo50
        self.photo100 = photo100
        self.photo200 = photo200
        self.left = left
        self.kicked = kicked
    }

}