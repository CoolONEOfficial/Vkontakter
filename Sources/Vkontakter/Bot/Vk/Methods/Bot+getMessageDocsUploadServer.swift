// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

public extension Bot {

    /// Parameters container struct for `getMessageDocsUploadServer` method
    class GetMessageDocsUploadServerParams: JSONEncodable {

        /// Тип документа.
        public enum `Type`: String, Codable {
            /// audio_message
            case audio_message
        
            /// doc
            case doc
        }
        
        public let `type`: Type?
        
        /// Идентификатор назначения. Для пользователя: id пользователя. Для групповой беседы: 2000000000 + id беседы. Для сообщества: -id сообщества.
        public var peerId: Int64?
        
        public init(type: Type? = nil, peerId: Int64? = nil) {
            self.type = `type`
            self.peerId = peerId
        }
    
    }
    
    struct GetMessageDocsUploadServerResp: Codable {
    
        public let uploadUrl: String?
        
        public init(uploadUrl: String? = nil) {
            self.uploadUrl = uploadUrl
        }
    
    }
    
    /**
     Получает адрес сервера для загрузки документа в личное сообщение.
     Возвращает объект с единственным полем upload_url (string), содержащим адрес сервера для загрузки документа.

     See also VK API Reference:
     [GetMessageDocsUploadServer](https://vk.com/dev/docs.getMessagesUploadServer)
     
     - Parameters:
         - params: Parameters container, see `GetMessageDocsUploadServerParams` struct
     - Throws: Throws on errors
     - Returns: Future of `GetMessageDocsUploadServerResp` type
     */
    @discardableResult
    func getMessageDocsUploadServer(params: GetMessageDocsUploadServerParams) throws -> Future<GetMessageDocsUploadServerResp> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "docs.getMessagesUploadServer", params: params, headers: headers)
            .flatMapThrowing { (container) -> GetMessageDocsUploadServerResp in
                return try self.processContainer(container)
        }
    }
}