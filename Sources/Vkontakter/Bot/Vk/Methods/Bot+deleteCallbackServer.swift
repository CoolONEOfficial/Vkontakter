//
//  Bot+deleteCallbackServer.swift
//
//
//  Created by Nickolay Truhin on 27.11.2020.
//

public extension Bot {

    /// Parameters container struct for `groups.deleteCallbackServer` method
    struct DeleteCallbackServerParams: JSONEncodable {

        /// Vk target group id
        let groupId: UInt64
        
        /// Vk target server id
        let serverId: UInt64

        /// Custom keys for coding/decoding `DeleteCallbackServersParams` struct
        enum CodingKeys: String, CodingKey {
            case groupId = "group_id"
            case serverId = "server_id"
        }

        public init(groupId: UInt64, serverId: UInt64) {
            self.groupId = groupId
            self.serverId = serverId
        }
    }

    /**
     Deletes Callback API server to the community.
     If succeed returns server ID in server_id field (integer).
     SeeAlso VK API Reference:
     [deleteCallbackServer](https://vk.com/dev/groups.deleteCallbackServer)
     
     - Parameters:
         - params: Parameters container, see `DeleteCallbackServerParams` struct
     - Throws: Throws on errors
     - Returns: Future of `DeleteCallbackServerResp` type
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
