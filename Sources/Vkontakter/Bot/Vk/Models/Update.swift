// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.
/**
 This object represents an incoming update.
 At most one of the optional parameters can be present in any given update.
 SeeAlso Telegram Bot API Reference:
 [Update](https://core.telegram.org/bots/api#update)
 */
public final class Update: Codable {

    /// Custom keys for coding/decoding `Update` struct
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case message = "object"
        case secretKey = "secret"
//        case editedMessage = "edited_message"
//        case channelPost = "channel_post"
//        case editedChannelPost = "edited_channel_post"
//        case inlineQuery = "inline_query"
//        case chosenInlineResult = "chosen_inline_result"
//        case callbackQuery = "callback_query"
//        case shippingQuery = "shipping_query"
//        case preCheckoutQuery = "pre_checkout_query"
//        case poll = "poll"
//        case pollAnswer = "poll_answer"
    }

    public enum `Type`: String, Codable {
        case message_new
        case confirmation
    }
    
    public let type: Type

    public let secretKey: String
    
    public enum Object {
        public struct MessageWrapper: Codable {
            public let message: Message
        }
    }
    
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        type = try values.decode(Type.self, forKey: .type)
//
//        switch type {
//        case .message_new:
//            message = (try values.decode(Object.MessageWrapper.self, forKey: .object)).message
//        }
//    }
    /// The update's unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you're using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
//    public var updateId: Int
//
    /// Optional. New incoming message of any kind — text, photo, sticker, etc.
    public var message: Object.MessageWrapper?
//
//    /// Optional. New version of a message that is known to the bot and was edited
//    public var editedMessage: Message?
//
//    /// Optional. New incoming channel post of any kind — text, photo, sticker, etc.
//    public var channelPost: Message?
//
//    /// Optional. New version of a channel post that is known to the bot and was edited
//    public var editedChannelPost: Message?
//
//    /// Optional. New incoming inline query
//    public var inlineQuery: InlineQuery?
//
//    /// Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
//    public var chosenInlineResult: ChosenInlineResult?
//
//    /// Optional. New incoming callback query
//    public var callbackQuery: CallbackQuery?
//
//    /// Optional. New incoming shipping query. Only for invoices with flexible price
//    public var shippingQuery: ShippingQuery?
//
//    /// Optional. New incoming pre-checkout query. Contains full information about checkout
//    public var preCheckoutQuery: PreCheckoutQuery?
//
//    /// Optional. New poll state. Bots receive only updates about stopped polls and polls, which are sent by the bot
//    public var poll: Poll?
//
//    /// Optional. A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.
//    public var pollAnswer: PollAnswer?
//
//    public init (updateId: Int, message: Message? = nil, editedMessage: Message? = nil, channelPost: Message? = nil, editedChannelPost: Message? = nil, inlineQuery: InlineQuery? = nil, chosenInlineResult: ChosenInlineResult? = nil, callbackQuery: CallbackQuery? = nil, shippingQuery: ShippingQuery? = nil, preCheckoutQuery: PreCheckoutQuery? = nil, poll: Poll? = nil, pollAnswer: PollAnswer? = nil) {
//        self.updateId = updateId
//        self.message = message
//        self.editedMessage = editedMessage
//        self.channelPost = channelPost
//        self.editedChannelPost = editedChannelPost
//        self.inlineQuery = inlineQuery
//        self.chosenInlineResult = chosenInlineResult
//        self.callbackQuery = callbackQuery
//        self.shippingQuery = shippingQuery
//        self.preCheckoutQuery = preCheckoutQuery
//        self.poll = poll
//        self.pollAnswer = pollAnswer
//    }
}
