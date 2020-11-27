//
//  Bot+addCallbackServer.swift
//  
//
//  Created by Nickolay Truhin on 27.11.2020.
//

public extension Bot {

    /// Parameters container struct for `groups.addCallbackServer` method
    struct AddCallbackServerParams: JSONEncodable {

        /// Vk target group id
        let groupId: UInt64
        
        /// Our url
        let url: String
        
        /// Vk server name
        let title: String
        
        /// Vk server confirmation key
        let secretKey: String

        /// Custom keys for coding/decoding `GetCallbackServersParams` struct
        enum CodingKeys: String, CodingKey {
            case groupId = "group_id"
            case url
            case title
            case secretKey = "secret_key"
        }

        public init(groupId: UInt64, url: String, title: String, secretKey: String) {
            self.groupId = groupId
            self.url = url
            self.title = title
            self.secretKey = secretKey
        }
    }
    
    struct AddCallbackServerResp: Codable {
        /// Custom keys for coding/decoding `AddCallbackServerResp` struct
        enum CodingKeys: String, CodingKey {
            case serverId = "server_id"
        }
        
        public let serverId: UInt64
    }

    /**
     Adds Callback API server to the community.
     If succeed returns server ID in server_id field (integer).
     SeeAlso VK API Reference:
     [addCallbackServer](https://vk.com/dev/groups.addCallbackServer)
     
     - Parameters:
         - params: Parameters container, see `AddCallbackServerParams` struct
     - Throws: Throws on errors
     - Returns: Future of `AddCallbackServerResp` type
     */
    @discardableResult
    func addCallbackServer(params: AddCallbackServerParams) throws -> Future<AddCallbackServerResp> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "groups.addCallbackServer", params: params, headers: headers)
            .flatMapThrowing { (container) -> AddCallbackServerResp in
                return try self.processContainer(container)
            }
    }
}
