//// Telegrammer - Telegram Bot Swift SDK.
//// This file is autogenerated by API/generate_wrappers.rb script.
//
//public extension Bot {
//
//    /// Parameters container struct for `setMyCommands` method
//    struct SetMyCommandsParams: JSONEncodable {
//
//        /// A JSON-serialized list of bot commands to be set as the list of the bot's commands. At most 100 commands can be specified.
//        var commands: [BotCommand]
//
//        /// Custom keys for coding/decoding `SetMyCommandsParams` struct
//        enum CodingKeys: String, CodingKey {
//            case commands = "commands"
//        }
//
//        public init(commands: [BotCommand]) {
//            self.commands = commands
//        }
//    }
//
//    /**
//     Use this method to change the list of the bot's commands. Returns True on success.
//
//     SeeAlso Telegram Bot API Reference:
//     [SetMyCommandsParams](https://core.telegram.org/bots/api#setmycommands)
//     
//     - Parameters:
//         - params: Parameters container, see `SetMyCommandsParams` struct
//     - Throws: Throws on errors
//     - Returns: Future of `Bool` type
//     */
//    @discardableResult
//    func setMyCommands(params: SetMyCommandsParams) throws -> Future<Bool> {
////        let body = try httpBody(for: params)
//        let headers = httpHeaders(for: params)
//        return try client
//            .request(endpoint: "setMyCommands", body: body, headers: headers)
//            .flatMapThrowing { (container) -> Bool in
//                return try self.processContainer(container)
//        }
//    }
//}
