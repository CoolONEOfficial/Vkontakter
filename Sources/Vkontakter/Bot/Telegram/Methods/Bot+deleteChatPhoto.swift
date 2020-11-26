// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

//public extension Bot {
//
//    /// Parameters container struct for `deleteChatPhoto` method
//    struct DeleteChatPhotoParams: JSONEncodable {
//
//        /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
//        var chatId: ChatId
//
//        /// Custom keys for coding/decoding `DeleteChatPhotoParams` struct
//        enum CodingKeys: String, CodingKey {
//            case chatId = "chat_id"
//        }
//
//        public init(chatId: ChatId) {
//            self.chatId = chatId
//        }
//    }
//
//    /**
//     Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
//
//     SeeAlso Telegram Bot API Reference:
//     [DeleteChatPhotoParams](https://core.telegram.org/bots/api#deletechatphoto)
//     
//     - Parameters:
//         - params: Parameters container, see `DeleteChatPhotoParams` struct
//     - Throws: Throws on errors
//     - Returns: Future of `Bool` type
//     */
//    @discardableResult
//    func deleteChatPhoto(params: DeleteChatPhotoParams) throws -> Future<Bool> {
//        let body = try httpBody(for: params)
//        let headers = httpHeaders(for: params)
//        return try client
//            .request(endpoint: "deleteChatPhoto", body: body, headers: headers)
//            .flatMapThrowing { (container) -> Bool in
//                return try self.processContainer(container)
//        }
//    }
//}
