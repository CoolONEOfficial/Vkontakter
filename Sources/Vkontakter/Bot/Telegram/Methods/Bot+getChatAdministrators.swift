//// Telegrammer - Telegram Bot Swift SDK.
//// This file is autogenerated by API/generate_wrappers.rb script.
//
//public extension Bot {
//
//    /// Parameters container struct for `getChatAdministrators` method
//    struct GetChatAdministratorsParams: JSONEncodable {
//
//        /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
//        var chatId: ChatId
//
//        /// Custom keys for coding/decoding `GetChatAdministratorsParams` struct
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
//     Use this method to get a list of administrators in a chat. On success, returns an Array of ChatMember objects that contains information about all chat administrators except other bots. If the chat is a group or a supergroup and no administrators were appointed, only the creator will be returned.
//
//     SeeAlso Telegram Bot API Reference:
//     [GetChatAdministratorsParams](https://core.telegram.org/bots/api#getchatadministrators)
//     
//     - Parameters:
//         - params: Parameters container, see `GetChatAdministratorsParams` struct
//     - Throws: Throws on errors
//     - Returns: Future of `[ChatMember]` type
//     */
//    @discardableResult
//    func getChatAdministrators(params: GetChatAdministratorsParams) throws -> Future<[ChatMember]> {
//        let body = try httpBody(for: params)
//        let headers = httpHeaders(for: params)
//        return try client
//            .request(endpoint: "getChatAdministrators", body: body, headers: headers)
//            .flatMapThrowing { (container) -> [ChatMember] in
//                return try self.processContainer(container)
//        }
//    }
//}
