// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

public extension Bot {

    /// Parameters container struct for `sendMessage` method
    struct SendMessageParams: JSONEncodable {

        /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
        //var chatId: ChatId
        var peerId: Int64

        /// Text of the message to be sent, 1-4096 characters after entities parsing
        var message: String
        
        var randomId: Int64

//        /// Mode for parsing entities in the message text. See formatting options for more details.
//        var parseMode: ParseMode?
//
//        /// Disables link previews for links in this message
//        var disableWebPagePreview: Bool?
//
//        /// Sends the message silently. Users will receive a notification with no sound.
//        var disableNotification: Bool?
//
//        /// If the message is a reply, ID of the original message
//        var replyToMessageId: Int?

        /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
        //var replyMarkup: ReplyMarkup?

        /// Custom keys for coding/decoding `SendMessageParams` struct
        enum CodingKeys: String, CodingKey {
            //case chatId = "chat_id"
            case peerId = "peer_id"
            case message = "message"
            case randomId = "random_id"
//            case parseMode = "parse_mode"
//            case disableWebPagePreview = "disable_web_page_preview"
//            case disableNotification = "disable_notification"
//            case replyToMessageId = "reply_to_message_id"
            //case replyMarkup = "reply_markup"
        }

        public init(peerId: Int64, randomId: Int64 = Int64.random(in: Int64.min ..< Int64.max),//chatId: ChatId,
                    message: String //parseMode: ParseMode? = nil, disableWebPagePreview: Bool? = nil, disableNotification: Bool? = nil, replyToMessageId: Int? = nil //, replyMarkup: ReplyMarkup? = nil
        ) {
            self.peerId = peerId
            self.randomId = randomId
           // self.chatId = chatId
            self.message = message
//            self.parseMode = parseMode
//            self.disableWebPagePreview = disableWebPagePreview
//            self.disableNotification = disableNotification
//            self.replyToMessageId = replyToMessageId
            //self.replyMarkup = replyMarkup
        }
    }

    /**
     Use this method to send text messages. On success, the sent Message is returned.

     SeeAlso Telegram Bot API Reference:
     [SendMessageParams](https://core.telegram.org/bots/api#sendmessage)
     
     - Parameters:
         - params: Parameters container, see `SendMessageParams` struct
     - Throws: Throws on errors
     - Returns: Future of `Message` type
     */
    @discardableResult
    func sendMessage(params: SendMessageParams) throws -> Future<Message> {
        //let body = try httpBody(for: params)
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "messages.send", params: params, headers: headers)
            .flatMapThrowing { (container) -> Message in
                return try self.processContainer(container)
        }
    }
}
