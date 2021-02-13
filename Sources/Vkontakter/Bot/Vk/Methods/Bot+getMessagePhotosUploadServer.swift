// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

public extension Bot {

    /// Parameters container struct for `getMessagePhotosUploadServer` method
    class GetMessagePhotosUploadServerParams: JSONEncodable {

        /// Идентификатор назначения (для загрузки фотографии в сообщениях сообществ). Для ботов/массовых рассылок с токеном сообщества можно указать peer_id=0. Изображение будет загружено в скрытый альбом группы.
        public var peerId: Int64?
        
        public init(peerId: Int64? = nil) {
            self.peerId = peerId
        }
    
    }
    
    struct GetMessagePhotosUploadServerResp: Codable {
    
        public let uploadUrl: String
        
        public let albumId: Int64
        
        public let groupId: UInt64
        
        public init(uploadUrl: String, albumId: Int64, groupId: UInt64) {
            self.uploadUrl = uploadUrl
            self.albumId = albumId
            self.groupId = groupId
        }
    
    }
    
    /**
     Возвращает адрес сервера для загрузки фотографии в личное сообщение.
     После успешного выполнения возвращает объект с полями upload_url, album_id (id альбома), group_id (идентификатор сообщества, если используются сообщения сообщества).

     See also VK API Reference:
     [GetMessagePhotosUploadServer](https://vk.com/dev/photos.getMessagesUploadServer)
     
     - Parameters:
         - params: Parameters container, see `GetMessagePhotosUploadServerParams` struct
     - Throws: Throws on errors
     - Returns: Future of `GetMessagePhotosUploadServerResp` type
     */
    @discardableResult
    func getMessagePhotosUploadServer(params: GetMessagePhotosUploadServerParams) throws -> Future<GetMessagePhotosUploadServerResp> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "photos.getMessagesUploadServer", params: params, headers: headers)
            .flatMapThrowing { (container) -> GetMessagePhotosUploadServerResp in
                return try self.processContainer(container)
        }
    }
}