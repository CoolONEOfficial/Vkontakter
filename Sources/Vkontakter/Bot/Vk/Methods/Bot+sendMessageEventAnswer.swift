// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

public extension Bot {

    /// Parameters container struct for `sendMessageEventAnswer` method
    final class SendMessageEventAnswerParams: JSONEncodable {

        /// случайная строка, которая возвращается в событии
        public let eventId: String
        
        /// Идентификатор пользователя.
        public let userId: Int64
        
        /// Идентификатор диалога со стороны сообщества.
        public let peerId: Int64
        
        /// Объект действия, которое должно произойти после нажатия на кнопку.
        public let eventData: EventData?
        
        public init(eventId: String, userId: Int64, peerId: Int64, eventData: EventData? = nil) {
            self.eventId = eventId
            self.userId = userId
            self.peerId = peerId
            self.eventData = eventData
        }
    
    }
    
    /**
     Отправляет событие с действием, которое произойдет при нажатии на callback-кнопку.
     После успешного выполнения возвращает 1.

     See also VK API Reference:
     [SendMessageEventAnswer](https://vk.com/dev/messages.sendMessageEventAnswer)
     
     - Parameters:
         - params: Parameters container, see `SendMessageEventAnswerParams` struct
     - Throws: Throws on errors
     - Returns: Future of `VkFlag` type
     */
    @discardableResult
    func sendMessageEventAnswer(params: SendMessageEventAnswerParams) throws -> Future<VkFlag> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "messages.sendMessageEventAnswer", params: params, headers: headers)
            .flatMapThrowing { (container) -> VkFlag in
                return try self.processContainer(container)
        }
    }
}