// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

/**
 Объект, описывающий запись на стене пользователя или сообщества,

 SeeAlso VK API Reference:
 [Post](https://vk.com/dev/objects/post
 */
public final class Post: Codable {
    /// Идентификатор записи.
    public let id: Int64?
    
    /// Идентификатор владельца стены, на которой размещена запись. В API ниже это поле называется .
    public let ownerId: Int64?
    
    /// Идентификатор автора записи (от чьего имени опубликована запись).
    public let fromId: Int64?
    
    /// Идентификатор администратора, который опубликовал запись (возвращается только для сообществ при запросе с ключом доступа администратора). Возвращается в записях, опубликованных менее 24 часов назад.
    public let createdBy: Int64?
    
    /// Время публикации записи в формате .
    public let date: Int64?
    
    /// Текст записи.
    public let text: String?
    
    /// Идентификатор владельца записи, в ответ на которую была оставлена текущая.
    public let replyOwnerId: Int64?
    
    /// Идентификатор записи, в ответ на которую была оставлена текущая.
    public let replyPostId: Int64?
    
    /// , если запись была создана с опцией «Только для друзей».
    public let friendsOnly: Int64?
    
    /// Информация о комментариях к записи,
    public final class Comments: Codable {
        
        /// Количество комментариев.
        public let count: Int64?
        
        /// Информация о том, может ли текущий пользователь комментировать запись (1 — может, 0 — не может).
        public let canPost: VkFlag?
        
        /// Информация о том, могут ли сообщества комментировать запись.
        public let groupsCanPost: VkFlag?
        
        /// Может ли текущий пользователь закрыть комментарии к записи.
        public let canClose: Bool?
        
        /// Может ли текущий пользователь открыть комментарии к записи.
        public let canOpen: Bool?
        
        public init(count: Int64? = nil, canPost: VkFlag? = nil, groupsCanPost: VkFlag? = nil, canClose: Bool? = nil, canOpen: Bool? = nil) {
            self.count = count
            self.canPost = canPost
            self.groupsCanPost = groupsCanPost
            self.canClose = canClose
            self.canOpen = canOpen
        }
    }
    
    let comments: Comments?
    
    /// Источник материала.
    public let copyright: String?
    
    /// Информация о лайках к записи,
    public final class Likes: Codable {
        
        /// Число пользователей, которым понравилась запись.
        public let count: Int64?
        
        /// Наличие отметки «Мне нравится» от текущего пользователя (1 — есть, 0 — нет).
        public let userLikes: VkFlag?
        
        /// Информация о том, может ли текущий пользователь поставить отметку «Мне нравится» (1 — может, 0 — не может).
        public let canLike: VkFlag?
        
        /// Информация о том, может ли текущий пользователь сделать репост записи (1 — может, 0 — не может).
        public let canPublish: VkFlag?
        
        public init(count: Int64? = nil, userLikes: VkFlag? = nil, canLike: VkFlag? = nil, canPublish: VkFlag? = nil) {
            self.count = count
            self.userLikes = userLikes
            self.canLike = canLike
            self.canPublish = canPublish
        }
    }
    
    let likes: Likes?
    
    /// Информация о репостах записи (),
    public final class Reposts: Codable {
        
        /// Число пользователей, скопировавших запись.
        public let count: Int64?
        
        /// Наличие репоста от текущего пользователя (1 — есть, 0 — нет).
        public let userReposted: VkFlag?
        
        public init(count: Int64? = nil, userReposted: VkFlag? = nil) {
            self.count = count
            self.userReposted = userReposted
        }
    }
    
    let reposts: Reposts?
    
    /// Информация о просмотрах записи.
    public final class Views: Codable {
        
        /// Число просмотров записи.
        public let count: Int64?
        
        public init(count: Int64? = nil) {
            self.count = count
        }
    }
    
    let views: Views?
    
    /// Тип записи, может принимать следующие значения: , , , , .
    public let postType: String?
    
    /// Информация о способе размещения записи. Описание объекта находится .
    public final class PostSource: Codable {
        
        
        public init() {
        }
    }
    
    let postSource: PostSource?
    
    /// Медиавложения записи (фотографии, ссылки и т.п.). Описание массива находится .
    public let attachments: [Attachment]?
    
    /// Информация о местоположении ,
    public final class Geo: Codable {
        
        /// Тип места.
        public let `type`: String?
        
        /// Координаты места.
        public let coordinates: String?
        
        /// Описание места (если оно добавлено). Объект места.
        public final class Place: Codable {
            
            
            public init() {
            }
        }
        
        let place: Place?
        
        public init(type: String? = nil, coordinates: String? = nil, place: Place? = nil) {
            self.type = `type`
            self.coordinates = coordinates
            self.place = place
        }
    }
    
    let geo: Geo?
    
    /// Идентификатор автора,
    public let signerId: Int64?
    
    /// Массив, содержащий историю репостов для записи. Возвращается только в том случае, если запись является репостом. Каждый из объектов массива, в свою очередь, является объектом-записью стандартного формата.
    public final class CopyHistory: Codable {
        
        
        public init() {
        }
    }
    
    let copyHistory: CopyHistory?
    
    /// Информация о том, может ли текущий пользователь закрепить запись ( — может, — не может).
    public let canPin: VkFlag?
    
    /// Информация о том, может ли текущий пользователь удалить запись ( — может, — не может).
    public let canDelete: VkFlag?
    
    /// Информация о том, может ли текущий пользователь редактировать запись ( — может, — не может).
    public let canEdit: VkFlag?
    
    /// Информация о том, что запись закреплена.
    public let isPinned: Int64?
    
    /// Информация о том, содержит ли запись отметку "реклама" ( — да, — нет).
    public let markedAsAds: VkFlag?
    
    /// , если объект добавлен в закладки у текущего пользователя.
    public final class IsFavorite: Codable {
        
        
        public init() {
        }
    }
    
    let isFavorite: IsFavorite?
    
    /// Информация о записи VK Donut:
    public final class Donut: Codable {
        
        /// Запись доступна только платным подписчикам VK Donut.
        public let isDonut: Bool?
        
        /// Время, в течение которого запись будет доступна только платным подписчикам VK Donut.
        public let paidDuration: Int64?
        
        /// Заглушка для пользователей, которые не оформили подписку VK Donut. Отображается вместо содержимого записи.
        public final class Placeholder: Codable {
            
            
            public init() {
            }
        }
        
        let placeholder: Placeholder?
        
        /// Можно ли открыть запись для всех пользователей, а не только подписчиков VK Donut.
        public let canPublishFreeCopy: Bool?
        
        /// Информация о том, какие значения VK Donut можно изменить в записи. Возможные значения: all — всю информацию о VK Donut. duration — время, в течение которого запись будет доступна только платным подписчикам VK Donut.
        public enum EditMode: String, Codable {
            case vsu_informaciu_o_vk_donut = "all"
            case vrema_v_tecenie_kotorogo_zapis_budet_dostupna_tolko_platnym_podpiscikam_vk_donut = "duration"
        }
        
        let editMode: EditMode?
        
        public init(isDonut: Bool? = nil, paidDuration: Int64? = nil, placeholder: Placeholder? = nil, canPublishFreeCopy: Bool? = nil, editMode: EditMode? = nil) {
            self.isDonut = isDonut
            self.paidDuration = paidDuration
            self.placeholder = placeholder
            self.canPublishFreeCopy = canPublishFreeCopy
            self.editMode = editMode
        }
    }
    
    let donut: Donut?
    
    /// Идентификатор отложенной записи. Это поле возвращается тогда, когда запись стояла на таймере.
    public let postponedId: Int64?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, fromId: Int64? = nil, createdBy: Int64? = nil, date: Int64? = nil, text: String? = nil, replyOwnerId: Int64? = nil, replyPostId: Int64? = nil, friendsOnly: Int64? = nil, comments: Comments? = nil, copyright: String? = nil, likes: Likes? = nil, reposts: Reposts? = nil, views: Views? = nil, postType: String? = nil, postSource: PostSource? = nil, attachments: [Attachment]? = nil, geo: Geo? = nil, signerId: Int64? = nil, copyHistory: CopyHistory? = nil, canPin: VkFlag? = nil, canDelete: VkFlag? = nil, canEdit: VkFlag? = nil, isPinned: Int64? = nil, markedAsAds: VkFlag? = nil, isFavorite: IsFavorite? = nil, donut: Donut? = nil, postponedId: Int64? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.fromId = fromId
        self.createdBy = createdBy
        self.date = date
        self.text = text
        self.replyOwnerId = replyOwnerId
        self.replyPostId = replyPostId
        self.friendsOnly = friendsOnly
        self.comments = comments
        self.copyright = copyright
        self.likes = likes
        self.reposts = reposts
        self.views = views
        self.postType = postType
        self.postSource = postSource
        self.attachments = attachments
        self.geo = geo
        self.signerId = signerId
        self.copyHistory = copyHistory
        self.canPin = canPin
        self.canDelete = canDelete
        self.canEdit = canEdit
        self.isPinned = isPinned
        self.markedAsAds = markedAsAds
        self.isFavorite = isFavorite
        self.donut = donut
        self.postponedId = postponedId
    }

}