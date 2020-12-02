// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

public extension Bot {

    /// Parameters container struct for `setCallbackSettings` method
    struct SetCallbackSettingsParams: JSONEncodable {

        /// Идентификатор сообщества.
        let groupId: Int64
        
        /// Идентификатор сервера.
        let serverId: Int64
        
        /// версия Callback API
        let apiVersion: String
        
        /// Уведомления о новых сообщениях (0 — выключить, 1 — включить).
        let messageNew: VkFlag
        
        /// Уведомления об исходящем сообщении (0 — выключить, 1 — включить).
        let messageReply: VkFlag
        
        /// Уведомления о подписке на сообщения (0 — выключить, 1 — включить).
        let messageAllow: VkFlag
        
        /// Уведомления о редактировании сообщения (0 — выключить, 1 — включить).
        let messageEdit: VkFlag
        
        /// Уведомления о запрете на сообщения (0 — выключить, 1 — включить).
        let messageDeny: VkFlag
        
        /// Уведомления о наборе текста сообщения ('0 — выключить, 1'' — включить).
        let messageTypingState: VkFlag
        
        /// Уведомления о добавлении новой фотографии (0 — выключить, 1 — включить).
        let photoNew: VkFlag
        
        /// Уведомления о добавлении новой аудиозаписи (0 — выключить, 1 — включить).
        let audioNew: VkFlag
        
        /// Уведомления о добавлении новой видеозаписи (0 — выключить, 1 — включить).
        let videoNew: VkFlag
        
        /// Уведомления о добавлении нового комментария на стене (0 — выключить, 1 — включить).
        let wallReplyNew: VkFlag
        
        /// Уведомления о редактировании комментария на стене (0 — выключить, 1 — включить).
        let wallReplyEdit: VkFlag
        
        /// Уведомления об удалении комментария на стене (0 — выключить, 1 — включить).
        let wallReplyDelete: VkFlag
        
        /// Уведомления о восстановлении комментария на стене (0 — выключить, 1 — включить).
        let wallReplyRestore: VkFlag
        
        /// Уведомления о новой записи на стене (0 — выключить, 1 — включить).
        let wallPostNew: VkFlag
        
        /// Уведомления о репосте записи (0 — выключить, 1 — включить).
        let wallRepost: VkFlag
        
        /// Уведомления о создании комментария в обсуждении (0 — выключить, 1 — включить).
        let boardPostNew: VkFlag
        
        /// Уведомления о редактировании комментария в обсуждении (0 — выключить, 1 — включить).
        let boardPostEdit: VkFlag
        
        /// Уведомление о восстановлении комментария в обсуждении (0 — выключить, 1 — включить).
        let boardPostRestore: VkFlag
        
        /// Уведомления об удалении комментария в обсуждении (0 — выключить, 1 — включить).
        let boardPostDelete: VkFlag
        
        /// Уведомления о добавлении нового комментария к фото (0 — выключить, 1 — включить).
        let photoCommentNew: VkFlag
        
        /// Уведомления о редактировании комментария к фото (0 — выключить, 1 — включить).
        let photoCommentEdit: VkFlag
        
        /// Уведомления об удалении комментария к фото (0 — выключить, 1 — включить).
        let photoCommentDelete: VkFlag
        
        /// Уведомления о восстановлении комментария к фото (0 — выключить, 1 — включить).
        let photoCommentRestore: VkFlag
        
        /// Уведомления о добавлении нового комментария к видео (0 — выключить, 1 — включить).
        let videoCommentNew: VkFlag
        
        /// Уведомления о редактировании комментария к видео (0 — выключить, 1 — включить).
        let videoCommentEdit: VkFlag
        
        /// Уведомления об удалении комментария к видео (0 — выключить, 1 — включить).
        let videoCommentDelete: VkFlag
        
        /// Уведомления о восстановлении комментария к видео (0 — выключить, 1 — включить).
        let videoCommentRestore: VkFlag
        
        /// Уведомления о добавлении нового комментария к товару (0 — выключить, 1 — включить).
        let marketCommentNew: VkFlag
        
        /// Уведомления о редактировании комментария к товару (0 — выключить, 1 — включить).
        let marketCommentEdit: VkFlag
        
        /// Уведомления об удалении комментария к товару (0 — выключить, 1 — включить).
        let marketCommentDelete: VkFlag
        
        /// Уведомления о восстановлении комментария к товару (0 — выключить, 1 — включить).
        let marketCommentRestore: VkFlag
        
        let marketOrderNew: VkFlag
        
        let marketOrderEdit: VkFlag
        
        /// Уведомления о новом голосе в публичных опросах (0 — выключить, 1 — включить).
        let pollVoteNew: VkFlag
        
        /// Уведомления о вступлении в сообщество (0 — выключить, 1 — включить).
        let groupJoin: VkFlag
        
        /// Уведомления о выходе из сообщества (0 — выключить, 1 — включить).
        let groupLeave: VkFlag
        
        /// Уведомления об изменении настроек (0 — выключить, 1 — включить).
        let groupChangeSettings: VkFlag
        
        /// Уведомления об изменении главной фотографии (0 — выключить, 1 — включить).
        let groupChangePhoto: VkFlag
        
        /// Уведомления об изменении руководства (0 — выключить, 1 — включить).
        let groupOfficersEdit: VkFlag
        
        /// Уведомления об внесении пользователя в чёрный список (0 — выключить, 1 — включить).
        let userBlock: VkFlag
        
        /// Уведомления об исключении пользователя из чёрного списка (0 — выключить, 1 — включить).
        let userUnblock: VkFlag
        
        /// уведомления о заполнении формы
        let leadFormsNew: VkFlag
        
        /// Уведомления о новой отметке "Мне нравится" (0 — выключить, 1 — включить).
        let likeAdd: VkFlag
        
        /// Уведомления о снятии отметки "Мне нравится" (0 — выключить, 1 — включить).
        let likeRemove: VkFlag
        
        let messageEvent: VkFlag
        
        /// Уведомление о создании подписки (0 — выключить, 1 — включить).
        let donutSubscriptionCreate: VkFlag
        
        /// Уведомление о продлении подписки (0 — выключить, 1 — включить).
        let donutSubscriptionProlonged: VkFlag
        
        /// Уведомление об отмене подписки (0 — выключить, 1 — включить).
        let donutSubscriptionCancelled: VkFlag
        
        /// Уведомление об изменении стоимости подписки (0 — выключить, 1 — включить).
        let donutSubscriptionPriceChanged: VkFlag
        
        /// Уведомление о том, что подписка истекла (0 — выключить, 1 — включить).
        let donutSubscriptionExpired: VkFlag
        
        /// Уведомление о выводе денег (0 — выключить, 1 — включить).
        let donutMoneyWithdraw: VkFlag
        
        /// Уведомление об ошибке при выводе денег (0 — выключить, 1 — включить).
        let donutMoneyWithdrawError: VkFlag
        
        public init(groupId: Int64, serverId: Int64, apiVersion: String, messageNew: VkFlag, messageReply: VkFlag, messageAllow: VkFlag, messageEdit: VkFlag, messageDeny: VkFlag, messageTypingState: VkFlag, photoNew: VkFlag, audioNew: VkFlag, videoNew: VkFlag, wallReplyNew: VkFlag, wallReplyEdit: VkFlag, wallReplyDelete: VkFlag, wallReplyRestore: VkFlag, wallPostNew: VkFlag, wallRepost: VkFlag, boardPostNew: VkFlag, boardPostEdit: VkFlag, boardPostRestore: VkFlag, boardPostDelete: VkFlag, photoCommentNew: VkFlag, photoCommentEdit: VkFlag, photoCommentDelete: VkFlag, photoCommentRestore: VkFlag, videoCommentNew: VkFlag, videoCommentEdit: VkFlag, videoCommentDelete: VkFlag, videoCommentRestore: VkFlag, marketCommentNew: VkFlag, marketCommentEdit: VkFlag, marketCommentDelete: VkFlag, marketCommentRestore: VkFlag, marketOrderNew: VkFlag, marketOrderEdit: VkFlag, pollVoteNew: VkFlag, groupJoin: VkFlag, groupLeave: VkFlag, groupChangeSettings: VkFlag, groupChangePhoto: VkFlag, groupOfficersEdit: VkFlag, userBlock: VkFlag, userUnblock: VkFlag, leadFormsNew: VkFlag, likeAdd: VkFlag, likeRemove: VkFlag, messageEvent: VkFlag, donutSubscriptionCreate: VkFlag, donutSubscriptionProlonged: VkFlag, donutSubscriptionCancelled: VkFlag, donutSubscriptionPriceChanged: VkFlag, donutSubscriptionExpired: VkFlag, donutMoneyWithdraw: VkFlag, donutMoneyWithdrawError: VkFlag) {
            self.groupId = groupId
            self.serverId = serverId
            self.apiVersion = apiVersion
            self.messageNew = messageNew
            self.messageReply = messageReply
            self.messageAllow = messageAllow
            self.messageEdit = messageEdit
            self.messageDeny = messageDeny
            self.messageTypingState = messageTypingState
            self.photoNew = photoNew
            self.audioNew = audioNew
            self.videoNew = videoNew
            self.wallReplyNew = wallReplyNew
            self.wallReplyEdit = wallReplyEdit
            self.wallReplyDelete = wallReplyDelete
            self.wallReplyRestore = wallReplyRestore
            self.wallPostNew = wallPostNew
            self.wallRepost = wallRepost
            self.boardPostNew = boardPostNew
            self.boardPostEdit = boardPostEdit
            self.boardPostRestore = boardPostRestore
            self.boardPostDelete = boardPostDelete
            self.photoCommentNew = photoCommentNew
            self.photoCommentEdit = photoCommentEdit
            self.photoCommentDelete = photoCommentDelete
            self.photoCommentRestore = photoCommentRestore
            self.videoCommentNew = videoCommentNew
            self.videoCommentEdit = videoCommentEdit
            self.videoCommentDelete = videoCommentDelete
            self.videoCommentRestore = videoCommentRestore
            self.marketCommentNew = marketCommentNew
            self.marketCommentEdit = marketCommentEdit
            self.marketCommentDelete = marketCommentDelete
            self.marketCommentRestore = marketCommentRestore
            self.marketOrderNew = marketOrderNew
            self.marketOrderEdit = marketOrderEdit
            self.pollVoteNew = pollVoteNew
            self.groupJoin = groupJoin
            self.groupLeave = groupLeave
            self.groupChangeSettings = groupChangeSettings
            self.groupChangePhoto = groupChangePhoto
            self.groupOfficersEdit = groupOfficersEdit
            self.userBlock = userBlock
            self.userUnblock = userUnblock
            self.leadFormsNew = leadFormsNew
            self.likeAdd = likeAdd
            self.likeRemove = likeRemove
            self.messageEvent = messageEvent
            self.donutSubscriptionCreate = donutSubscriptionCreate
            self.donutSubscriptionProlonged = donutSubscriptionProlonged
            self.donutSubscriptionCancelled = donutSubscriptionCancelled
            self.donutSubscriptionPriceChanged = donutSubscriptionPriceChanged
            self.donutSubscriptionExpired = donutSubscriptionExpired
            self.donutMoneyWithdraw = donutMoneyWithdraw
            self.donutMoneyWithdrawError = donutMoneyWithdrawError
        }
    
    }
    
    /**
     Позволяет задать настройки уведомлений о событиях в Callback API.
     После успешного выполнения возвращает 1.

     See also VK API Reference:
     [SetCallbackSettings](https://vk.com/dev/groups.setCallbackSettings)
     
     - Parameters:
         - params: Parameters container, see `SetCallbackSettingsParams` struct
     - Throws: Throws on errors
     - Returns: Future of `VkFlag` type
     */
    @discardableResult
    func setCallbackSettings(params: SetCallbackSettingsParams) throws -> Future<VkFlag> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "groups.setCallbackSettings", params: params, headers: headers)
            .flatMapThrowing { (container) -> VkFlag in
                return try self.processContainer(container)
        }
    }
}
