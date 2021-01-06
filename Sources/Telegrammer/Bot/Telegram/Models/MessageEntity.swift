// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

/**
 This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.

 SeeAlso Telegram Bot API Reference:
 [MessageEntity](https://core.telegram.org/bots/api#messageentity)
 */
public final class MessageEntity: Codable {

    /// Custom keys for coding/decoding `MessageEntity` struct
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case offset = "offset"
        case length = "length"
        case url = "url"
        case user = "user"
        case language = "language"
    }

    /// Type of the entity. Can be “mention” (@username), “hashtag” (#hashtag), “cashtag” ($USD), “bot_command” (/start@jobs_bot), “url” (https://telegram.org), “email” (do-not-reply@telegram.org), “phone_number” (+1-212-555-0123), “bold” (bold text), “italic” (italic text), “underline” (underlined text), “strikethrough” (strikethrough text), “code” (monowidth string), “pre” (monowidth block), “text_link” (for clickable text URLs), “text_mention” (for users without usernames)
    public var type: MessageEntityType

    /// Offset in UTF-16 code units to the start of the entity
    public var offset: Int

    /// Length of the entity in UTF-16 code units
    public var length: Int

    /// Optional. For “text_link” only, url that will be opened after user taps on the text
    public var url: String?

    /// Optional. For “text_mention” only, the mentioned user
    public var user: User?

    /// Optional. For “pre” only, the programming language of the entity text
    public var language: String?

    public init (type: MessageEntityType, offset: Int, length: Int, url: String? = nil, user: User? = nil, language: String? = nil) {
        self.type = type
        self.offset = offset
        self.length = length
        self.url = url
        self.user = user
        self.language = language
    }
}