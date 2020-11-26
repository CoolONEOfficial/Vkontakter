//// Telegrammer - Telegram Bot Swift SDK.
//// This file is autogenerated by API/generate_wrappers.rb script.
//
//public extension Bot {
//
//    /// Parameters container struct for `exportChatInviteLink` method
//    struct ExportChatInviteLinkParams: JSONEncodable {
//
//        /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
//        var chatId: ChatId
//
//        /// Custom keys for coding/decoding `ExportChatInviteLinkParams` struct
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
//     Use this method to generate a new invite link for a chat; any previously generated link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns the new invite link as String on success.
//
//     SeeAlso Telegram Bot API Reference:
//     [ExportChatInviteLinkParams](https://core.telegram.org/bots/api#exportchatinvitelink)
//     
//     - Parameters:
//         - params: Parameters container, see `ExportChatInviteLinkParams` struct
//     - Throws: Throws on errors
//     - Returns: Future of `String` type
//     */
//    @discardableResult
//    func exportChatInviteLink(params: ExportChatInviteLinkParams) throws -> Future<String> {
//        let body = try httpBody(for: params)
//        let headers = httpHeaders(for: params)
//        return try client
//            .request(endpoint: "exportChatInviteLink", body: body, headers: headers)
//            .flatMapThrowing { (container) -> String in
//                return try self.processContainer(container)
//        }
//    }
//}
