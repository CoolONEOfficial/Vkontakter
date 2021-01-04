// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Список объектов › Видеозапись Объект, описывающий видеозапись, содержит следующие поля: id integer идентификатор видеозаписи. owner_id integer идентификатор владельца видеозаписи. title string название видеозаписи. description string текст описания видеозаписи. duration integer длительность ролика в секундах. image array Изображение обложки. Содержит массив объектов с полями: "height" (integer) — Высота изображения. "url" (string) — Ссылка на изображение "width" (integer) — Ширина изображение "with_padding" (integer) — Поле возвращается, если изображение с отбивкой, всегда содержит 1. first_frame array Изображение первого кадра. Содержит массив объектов с полями: "height" (integer) — Высота изображения. "url" (string) — Ссылка на изображение "width" (integer) — Ширина изображение date integer дата создания видеозаписи в формате Unixtime. adding_date integer дата добавления видеозаписи пользователем или группой в формате Unixtime. views integer количество просмотров видеозаписи. local_views integer Если видео внешнее, количество просмотров в ВК. comments integer количество комментариев к видеозаписи. player string URL страницы с плеером, который можно использовать для воспроизведения ролика в браузере. Поддерживается flash и html5, плеер всегда масштабируется по размеру окна. platform string название платформы (для видеозаписей, добавленных с внешних сайтов). can_edit integer, [1] поле возвращается, если пользователь может редактировать видеозапись, всегда содержит 1. can_add integer, [0,1] Может ли пользователь добавить видеозапись к себе. 0 — Не может добавить. 1 — Может добавить. is_private integer, [1] поле возвращается, если видеозапись приватная (например, была загружена в личное сообщение), всегда содержит 1. access_key string ключ доступа к объекту. Подробнее см. Ключ доступа к данным access_key. processing integer, [1] поле возвращается в том случае, если видеоролик находится в процессе обработки, всегда содержит 1. is_favorite boolean true, если объект добавлен в закладки у текущего пользователя. can_comment integer, [0,1] Может ли пользователь комментировать видео. 0 — Не может комментировать. 1 — Может комментировать. can_edit integer, [0,1] Может ли пользователь редактировать видео. 0 — Не может редактировать. 1 — Может редактировать. can_like integer, [0,1] 'Может ли пользователь добавить видео в список <<Мне нравится>>. 0 — Не может добавить. 1 — Может добавить. can_repost integer, [0,1] Может ли пользователь сделать репост видео. 0 — Не может сделать репост. 1 — Может сделать репост. can_subscribe integer, [0,1] Может ли пользователь подписаться на автора видео. 0 — Не может подписаться. 1 — Может подписаться. can_add_to_faves integer, [0,1] Может ли пользователь добавить видео в избранное. 0 — Не может добавить. 1 — Может добавить. can_attach_link integer, [0,1] Может ли пользователь прикрепить кнопку действия к видео. 0 — Не может прикрепить. 1 — Может прикрепить. width integer Ширина видео. height integer Высота видео. user_id integer Идентификатор пользователя, загрузившего видео, если оно было загружено в группу одним из участников. converting integer, [0,1] Конвертируется ли видео. 0 — Не конвертируется. 1 — Конвертируется. added integer, [0,1] Добавлено ли видео в альбомы пользователя. 0 — Не добавлено. 1 — Добавлено. is_subscribed integer, [0,1] Подписан ли пользователь на автора видео. 0 — Не подписан. 1 — Подписан. repeat integer поле возвращается в том случае, если видео зациклено, всегда содержит 1 type string Тип видеозаписи. Может принимать значения: "video", "music_video", "movie". balance integer Баланс донатов в прямой трансляции. live_status string Статус прямой трансляции. Может принимать значения: "waiting", "started", "finished", "failed", "upcoming". live integer, [1] поле возвращается в том случае, если видеозапись является прямой трансляцией, всегда содержит 1. Обратите внимание, в этом случае в поле duration содержится значение 0. upcoming integer, [1] (для live = 1). Поле свидетельствует о том, что трансляция скоро начнётся. spectators integer Количество зрителей прямой трансляции. likes object Содержит объект отметки <<Мне нравится>>. "count" (integer) — Количество лайков. "user_likes" (integer, [0,1]) — Добавлено ли видео в список <<Мне нравится>> текущего пользователя. 0 — Не добавлено. 1 — Добавлено. reposts object Содержит объект репоста. "count" (integer) — Счетчик общего количества репостов. Содержит сумму репостов на стену и в личные сообщения. "wall_count" (integer) — Счетчик репостов на стену. "mail_count" (integer) — Счетчик репостов в личные сообщения. "user_reposted" (integer) — Информация о том, сделал ли текущий пользователь репост этого видео.

 SeeAlso VK API Reference:
 [Video](https://vk.com/dev/objects/video
 */
public final class Video: Codable {
    /// Идентификатор видеозаписи.
    public let id: Int64?
    
    /// Идентификатор владельца видеозаписи.
    public let ownerId: Int64?
    
    /// Название видеозаписи.
    public let title: String?
    
    /// Текст описания видеозаписи.
    public let description: String?
    
    /// Длительность ролика в секундах.
    public let duration: Int64?
    
    /// Изображение обложки.
    public final class Image: Codable {
        
        /// Высота изображения.
        public let Height: Int64?
        
        /// Ссылка на изображение
        public let Url: String?
        
        /// Ширина изображение
        public let Width: Int64?
        
        /// Поле возвращается, если изображение с отбивкой, всегда содержит 1.
        public let WithPadding: Int64?
        
        public init(Height: Int64? = nil, Url: String? = nil, Width: Int64? = nil, WithPadding: Int64? = nil) {
            self.Height = Height
            self.Url = Url
            self.Width = Width
            self.WithPadding = WithPadding
        }
    }
    
    public let image: [Image]?
    
    /// Изображение первого кадра.
    public final class FirstFrame: Codable {
        
        /// Высота изображения.
        public let Height: Int64?
        
        /// Ссылка на изображение
        public let Url: String?
        
        /// Ширина изображение
        public let Width: Int64?
        
        public init(Height: Int64? = nil, Url: String? = nil, Width: Int64? = nil) {
            self.Height = Height
            self.Url = Url
            self.Width = Width
        }
    }
    
    public let firstFrame: [FirstFrame]?
    
    /// Дата создания видеозаписи в формате Unixtime.
    public let date: UInt64?
    
    /// Дата добавления видеозаписи пользователем или группой в формате Unixtime.
    public let addingDate: UInt64?
    
    /// Количество просмотров видеозаписи.
    public let views: Int64?
    
    /// Если видео внешнее, количество просмотров в ВК.
    public let localViews: Int64?
    
    /// Количество комментариев к видеозаписи.
    public let comments: Int64?
    
    /// URL страницы с плеером, который можно использовать для воспроизведения ролика в браузере. Поддерживается flash и html5, плеер всегда масштабируется по размеру окна.
    public let player: String?
    
    /// Название платформы (для видеозаписей, добавленных с внешних сайтов).
    public let platform: String?
    
    /// Поле возвращается, если пользователь может редактировать видеозапись, всегда содержит 1.
    public let canEdit: Int64?
    
    /// Может ли пользователь добавить видеозапись к себе.
    public let canAdd: VkFlag?
    
    /// Поле возвращается, если видеозапись приватная (например, была загружена в личное сообщение), всегда содержит 1.
    public let isPrivate: Int64?
    
    /// Ключ доступа к объекту. Подробнее см. Ключ доступа к данным access_key.
    public final class AccessKey: Codable {
        
        
        public init() {
        }
    }
    
    public let accessKey: AccessKey?
    
    /// Поле возвращается в том случае, если видеоролик находится в процессе обработки, всегда содержит 1.
    public let processing: Int64?
    
    /// True, если объект добавлен в закладки у текущего пользователя.
    public final class IsFavorite: Codable {
        
        
        public init() {
        }
    }
    
    public let isFavorite: IsFavorite?
    
    /// Может ли пользователь комментировать видео.
    public let canComment: VkFlag?
    
    /// 'Может ли пользователь добавить видео в список <<Мне нравится>>.
    public let canLike: [Int64]?
    
    /// Может ли пользователь сделать репост видео.
    public let canRepost: VkFlag?
    
    /// Может ли пользователь подписаться на автора видео.
    public let canSubscribe: VkFlag?
    
    /// Может ли пользователь добавить видео в избранное.
    public let canAddToFaves: VkFlag?
    
    /// Может ли пользователь прикрепить кнопку действия к видео.
    public let canAttachLink: VkFlag?
    
    /// Ширина видео.
    public let width: Int64?
    
    /// Высота видео.
    public let height: Int64?
    
    /// Идентификатор пользователя, загрузившего видео, если оно было загружено в группу одним из участников.
    public let userId: Int64?
    
    /// Конвертируется ли видео.
    public let converting: VkFlag?
    
    /// Добавлено ли видео в альбомы пользователя.
    public let added: VkFlag?
    
    /// Подписан ли пользователь на автора видео.
    public let isSubscribed: VkFlag?
    
    /// Поле возвращается в том случае, если видео зациклено,
    public let `repeat`: Int64?
    
    /// Тип видеозаписи. Может принимать значения: "video", "music_video", "movie".
    public let `type`: String?
    
    /// Баланс донатов в прямой трансляции.
    public let balance: Int64?
    
    /// Статус прямой трансляции. Может принимать значения: "waiting", "started", "finished", "failed", "upcoming".
    public let liveStatus: String?
    
    /// Поле возвращается в том случае, если видеозапись является прямой трансляцией, всегда содержит 1. Обратите внимание, в этом случае в поле duration содержится значение 0.
    public let live: Int64?
    
    /// (для live = 1). Поле свидетельствует о том, что трансляция скоро начнётся.
    public let upcoming: Int64?
    
    /// Количество зрителей прямой трансляции.
    public let spectators: Int64?
    
    /// Содержит объект отметки <<Мне нравится>>.
    public final class Likes: Codable {
        
        /// Количество лайков.
        public let Count: Int64?
        
        /// Добавлено ли видео в список <<Мне нравится>> текущего пользователя. 0 — Не добавлено. 1 — Добавлено.
        public let UserLikes: [Int64]?
        
        public init(Count: Int64? = nil, UserLikes: [Int64]? = nil) {
            self.Count = Count
            self.UserLikes = UserLikes
        }
    }
    
    public let likes: Likes?
    
    /// Содержит объект репоста.
    public final class Reposts: Codable {
        
        /// Счетчик общего количества репостов. Содержит сумму репостов на стену и в личные сообщения.
        public let Count: Int64?
        
        /// Счетчик репостов на стену.
        public let WallCount: Int64?
        
        /// Счетчик репостов в личные сообщения.
        public let MailCount: Int64?
        
        /// Информация о том, сделал ли текущий пользователь репост этого видео.
        public let UserReposted: Int64?
        
        public init(Count: Int64? = nil, WallCount: Int64? = nil, MailCount: Int64? = nil, UserReposted: Int64? = nil) {
            self.Count = Count
            self.WallCount = WallCount
            self.MailCount = MailCount
            self.UserReposted = UserReposted
        }
    }
    
    public let reposts: Reposts?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, title: String? = nil, description: String? = nil, duration: Int64? = nil, image: [Image]? = nil, firstFrame: [FirstFrame]? = nil, date: UInt64? = nil, addingDate: UInt64? = nil, views: Int64? = nil, localViews: Int64? = nil, comments: Int64? = nil, player: String? = nil, platform: String? = nil, canEdit: Int64? = nil, canAdd: VkFlag? = nil, isPrivate: Int64? = nil, accessKey: AccessKey? = nil, processing: Int64? = nil, isFavorite: IsFavorite? = nil, canComment: VkFlag? = nil, canLike: [Int64]? = nil, canRepost: VkFlag? = nil, canSubscribe: VkFlag? = nil, canAddToFaves: VkFlag? = nil, canAttachLink: VkFlag? = nil, width: Int64? = nil, height: Int64? = nil, userId: Int64? = nil, converting: VkFlag? = nil, added: VkFlag? = nil, isSubscribed: VkFlag? = nil, repeat: Int64? = nil, type: String? = nil, balance: Int64? = nil, liveStatus: String? = nil, live: Int64? = nil, upcoming: Int64? = nil, spectators: Int64? = nil, likes: Likes? = nil, reposts: Reposts? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.title = title
        self.description = description
        self.duration = duration
        self.image = image
        self.firstFrame = firstFrame
        self.date = date
        self.addingDate = addingDate
        self.views = views
        self.localViews = localViews
        self.comments = comments
        self.player = player
        self.platform = platform
        self.canEdit = canEdit
        self.canAdd = canAdd
        self.isPrivate = isPrivate
        self.accessKey = accessKey
        self.processing = processing
        self.isFavorite = isFavorite
        self.canComment = canComment
        self.canLike = canLike
        self.canRepost = canRepost
        self.canSubscribe = canSubscribe
        self.canAddToFaves = canAddToFaves
        self.canAttachLink = canAttachLink
        self.width = width
        self.height = height
        self.userId = userId
        self.converting = converting
        self.added = added
        self.isSubscribed = isSubscribed
        self.repeat = `repeat`
        self.type = `type`
        self.balance = balance
        self.liveStatus = liveStatus
        self.live = live
        self.upcoming = upcoming
        self.spectators = spectators
        self.likes = likes
        self.reposts = reposts
    }

}