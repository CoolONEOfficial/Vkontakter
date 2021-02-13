// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

public extension Bot {

    /// Parameters container struct for `deleteCallbackServer` method
    class DeleteCallbackServerParams: JSONEncodable {

        /// Идентификатор сообщества.
        public let groupId: UInt64
        
        /// Идентификатор сервера, который нужно удалить.
        public let serverId: UInt64
        
        public init(groupId: UInt64, serverId: UInt64) {
            self.groupId = groupId
            self.serverId = serverId
        }
    
    }
    
    /**
     Удаляет сервер для Callback API из сообщества.
     После успешного выполнения возвращает 1.

     See also VK API Reference:
     [DeleteCallbackServer](https://vk.com/dev/groups.deleteCallbackServer)
     
     - Parameters:
         - params: Parameters container, see `DeleteCallbackServerParams` struct
     - Throws: Throws on errors
     - Returns: Future of `VkFlag` type
     */
    @discardableResult
    func deleteCallbackServer(params: DeleteCallbackServerParams) throws -> Future<VkFlag> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "groups.deleteCallbackServer", params: params, headers: headers)
            .flatMapThrowing { (container) -> VkFlag in
                return try self.processContainer(container)
        }
    }
}