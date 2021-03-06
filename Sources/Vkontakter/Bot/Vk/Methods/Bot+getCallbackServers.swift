// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

public extension Bot {

    /// Parameters container struct for `getCallbackServers` method
    class GetCallbackServersParams: JSONEncodable {

        /// Идентификатор сообщества.
        public let groupId: UInt64
        
        /// Идентификаторы серверов, данные о которых нужно получить. По умолчанию возвращаются все серверы.
        public let serverIds: [String]?
        
        public init(groupId: UInt64, serverIds: [String]? = nil) {
            self.groupId = groupId
            self.serverIds = serverIds
        }
    
    }
    
    struct GetCallbackServersResp: Codable {
    
        public struct Item: Codable {
            
            /// Идентификатор сервера.
            public let id: UInt64?
            
            /// Название сервера.
            public let title: String?
            
            /// Идентификатор пользователя, который добавил сервер (может содержать 0).
            public let creatorId: Int64?
            
            /// URL сервера.
            public let url: String?
            
            /// Секретный ключ.
            public let secretKey: String?
            
            /// Статус сервера. Возможные значения: 
            public enum Status: String, Codable {
                /// unconfigured — адрес не задан;
                case unconfigured
            
                /// wait — адрес ожидает подтверждения;
                case wait
            
                /// failed — подтвердить адрес не удалось;
                case failed
            
                /// ok — сервер подключен.
                case ok
            }
            
            public let status: Status?
            
            public init(id: UInt64? = nil, title: String? = nil, creatorId: Int64? = nil, url: String? = nil, secretKey: String? = nil, status: Status? = nil) {
                self.id = id
                self.title = title
                self.creatorId = creatorId
                self.url = url
                self.secretKey = secretKey
                self.status = status
            }
        }
        
        public let items: [Item]
        
        public init(items: [Item]) {
            self.items = items
        }
    
    }
    
    /**
     Получает информацию о серверах для Callback API в сообществе.
     Возвращает число серверов в поле count (integer) и массив объектов items с данными о серверах.

     See also VK API Reference:
     [GetCallbackServers](https://vk.com/dev/groups.getCallbackServers)
     
     - Parameters:
         - params: Parameters container, see `GetCallbackServersParams` struct
     - Throws: Throws on errors
     - Returns: Future of `GetCallbackServersResp` type
     */
    @discardableResult
    func getCallbackServers(params: GetCallbackServersParams) throws -> Future<GetCallbackServersResp> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "groups.getCallbackServers", params: params, headers: headers)
            .flatMapThrowing { (container) -> GetCallbackServersResp in
                return try self.processContainer(container)
        }
    }
}