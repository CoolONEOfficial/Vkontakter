// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий вики-страницу,

 SeeAlso VK API Reference:
 [Page](https://vk.com/dev/objects/page
 */
public struct Page: Codable {
    /// Идентификатор вики-страницы.
    public let id: Int64?
    
    /// Идентификатор сообщества.
    public let groupId: UInt64?
    
    /// Идентификатор создателя вики-страницы.
    public let creatorId: Int64?
    
    /// Название вики-страницы.
    public let title: String?
    
    /// 1, если текущий пользователь может редактировать текст вики-страницы, иначе — 0.
    public let currentUserCanEdit: VkFlag?
    
    /// 1, если текущий пользователь может изменять права доступа на вики-страницу, иначе — 0.
    public let currentUserCanEditAccess: VkFlag?
    
    /// Информация о том,
    public let whoCanView: Int64?
    
    /// Указывает,
    public let whoCanEdit: Int64?
    
    /// Дата последнего изменения вики-страницы в формате Unixtime.
    public let edited: UInt64?
    
    /// Дата создания вики-страницы в формате Unixtime.
    public let created: String?
    
    /// Идентификатор пользователя, который редактировал вики-страницу последним.
    public let editorId: Int64?
    
    /// Количество просмотров вики-страницы.
    public let views: Int64?
    
    /// Заголовок родительской страницы для навигации, если есть.
    public let parent: String?
    
    /// Заголовок второй родительской страницы для навигации,
    public let parent2: String?
    
    /// Текст страницы в вики-формате, если был запрошен.
    public let source: String?
    
    /// Текст страницы в html-формате, если был запрошен.
    public let html: String?
    
    /// Адрес страницы для отображения вики-страницы.
    public let viewUrl: String?
    
    public init(id: Int64? = nil, groupId: UInt64? = nil, creatorId: Int64? = nil, title: String? = nil, currentUserCanEdit: VkFlag? = nil, currentUserCanEditAccess: VkFlag? = nil, whoCanView: Int64? = nil, whoCanEdit: Int64? = nil, edited: UInt64? = nil, created: String? = nil, editorId: Int64? = nil, views: Int64? = nil, parent: String? = nil, parent2: String? = nil, source: String? = nil, html: String? = nil, viewUrl: String? = nil) {
        self.id = id
        self.groupId = groupId
        self.creatorId = creatorId
        self.title = title
        self.currentUserCanEdit = currentUserCanEdit
        self.currentUserCanEditAccess = currentUserCanEditAccess
        self.whoCanView = whoCanView
        self.whoCanEdit = whoCanEdit
        self.edited = edited
        self.created = created
        self.editorId = editorId
        self.views = views
        self.parent = parent
        self.parent2 = parent2
        self.source = source
        self.html = html
        self.viewUrl = viewUrl
    }

}