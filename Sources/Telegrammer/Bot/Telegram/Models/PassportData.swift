// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

/**
 Contains information about Telegram Passport data shared with the bot by the user.

 SeeAlso Telegram Bot API Reference:
 [PassportData](https://core.telegram.org/bots/api#passportdata)
 */
public final class PassportData: Codable {

    /// Custom keys for coding/decoding `PassportData` struct
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case credentials = "credentials"
    }

    /// Array with information about documents and other Telegram Passport elements that was shared with the bot
    public var data: [EncryptedPassportElement]

    /// Encrypted credentials required to decrypt the data
    public var credentials: EncryptedCredentials

    public init (data: [EncryptedPassportElement], credentials: EncryptedCredentials) {
        self.data = data
        self.credentials = credentials
    }
}