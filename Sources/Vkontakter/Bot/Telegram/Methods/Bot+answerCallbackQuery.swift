//// Telegrammer - Telegram Bot Swift SDK.
//// This file is autogenerated by API/generate_wrappers.rb script.
//
//public extension Bot {
//
//    /// Parameters container struct for `answerCallbackQuery` method
//    struct AnswerCallbackQueryParams: JSONEncodable {
//
//        /// Unique identifier for the query to be answered
//        var callbackQueryId: String
//
//        /// Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters
//        var text: String?
//
//        /// If true, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to false.
//        var showAlert: Bool?
//
//        /// URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @Botfather, specify the URL that opens your game — note that this will only work if the query comes from a callback_game button.
//        /// 
//        /// Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
//        var url: String?
//
//        /// The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
//        var cacheTime: Int?
//
//        /// Custom keys for coding/decoding `AnswerCallbackQueryParams` struct
//        enum CodingKeys: String, CodingKey {
//            case callbackQueryId = "callback_query_id"
//            case text = "text"
//            case showAlert = "show_alert"
//            case url = "url"
//            case cacheTime = "cache_time"
//        }
//
//        public init(callbackQueryId: String, text: String? = nil, showAlert: Bool? = nil, url: String? = nil, cacheTime: Int? = nil) {
//            self.callbackQueryId = callbackQueryId
//            self.text = text
//            self.showAlert = showAlert
//            self.url = url
//            self.cacheTime = cacheTime
//        }
//    }
//
//    /**
//     Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
//     Alternatively, the user can be redirected to the specified Game URL. For this option to work, you must first create a game for your bot via @Botfather and accept the terms. Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
//
//     SeeAlso Telegram Bot API Reference:
//     [AnswerCallbackQueryParams](https://core.telegram.org/bots/api#answercallbackquery)
//     
//     - Parameters:
//         - params: Parameters container, see `AnswerCallbackQueryParams` struct
//     - Throws: Throws on errors
//     - Returns: Future of `Bool` type
//     */
//    @discardableResult
//    func answerCallbackQuery(params: AnswerCallbackQueryParams) throws -> Future<Bool> {
//        let body = try httpBody(for: params)
//        let headers = httpHeaders(for: params)
//        return try client
//            .request(endpoint: "answerCallbackQuery", body: body, headers: headers)
//            .flatMapThrowing { (container) -> Bool in
//                return try self.processContainer(container)
//        }
//    }
//}
