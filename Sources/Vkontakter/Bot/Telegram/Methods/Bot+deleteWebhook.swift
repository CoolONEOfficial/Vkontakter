//// Telegrammer - Telegram Bot Swift SDK.
//// This file is autogenerated by API/generate_wrappers.rb script.
//
//public extension Bot {
//
//    /**
//     Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success. Requires no parameters.
//
//     SeeAlso Telegram Bot API Reference:
//     [DeleteWebhookParams](https://core.telegram.org/bots/api#deletewebhook)
//     
//     - Parameters:
//         - params: Parameters container, see `DeleteWebhookParams` struct
//     - Throws: Throws on errors
//     - Returns: Future of `Bool` type
//     */
//    @discardableResult
//    func deleteWebhook() throws -> Future<Bool> {
//        return try client
//            .request(endpoint: "deleteWebhook")
//            .flatMapThrowing { (container) -> Bool in
//                return try self.processContainer(container)
//        }
//    }
//}
