//// Telegrammer - Telegram Bot Swift SDK.
//// This file is autogenerated by API/generate_wrappers.rb script.
//
//public extension Bot {
//
//    /// Parameters container struct for `setChatTitle` method
//    struct SetChatTitleParams: JSONEncodable {
//
//        /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
//        var chatId: ChatId
//
//        /// New chat title, 1-255 characters
//        var title: String
//
//        /// Custom keys for coding/decoding `SetChatTitleParams` struct
//        enum CodingKeys: String, CodingKey {
//            case chatId = "chat_id"
//            case title = "title"
//        }
//
//        public init(chatId: ChatId, title: String) {
//            self.chatId = chatId
//            self.title = title
//        }
//    }
//
//    /**
//     Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
//
//     SeeAlso Telegram Bot API Reference:
//     [SetChatTitleParams](https://core.telegram.org/bots/api#setchattitle)
//     
//     - Parameters:
//         - params: Parameters container, see `SetChatTitleParams` struct
//     - Throws: Throws on errors
//     - Returns: Future of `Bool` type
//     */
//    @discardableResult
//    func setChatTitle(params: SetChatTitleParams) throws -> Future<Bool> {
//        let body = try httpBody(for: params)
//        let headers = httpHeaders(for: params)
//        return try client
//            .request(endpoint: "setChatTitle", body: body, headers: headers)
//            .flatMapThrowing { (container) -> Bool in
//                return try self.processContainer(container)
//        }
//    }
//}
