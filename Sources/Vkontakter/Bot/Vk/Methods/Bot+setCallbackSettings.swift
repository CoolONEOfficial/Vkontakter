//
//  Bot+setCallbackSettings.swift
//
//
//  Created by Nickolay Truhin on 27.11.2020.
//

public enum VkFlag: Int, Codable {
    case on = 1
    case off = 0
    
    public var bool: Bool {
        self == .on
    }
}

public extension Bot {

    /// Parameters container struct for `groups.setCallbackSettings` method
    struct SetCallbackSettingsParams: JSONEncodable {

        /// Vk target group id
        let groupId: UInt64
        
        /// Vk target server id
        let serverId: UInt64
        
        public enum ApiVersion: String, Codable {
            case v5_126 = "5.126"
        }
        
        let apiVersion: ApiVersion
        
        let messageNew: VkFlag

        /// Custom keys for coding/decoding `SetCallbackSettingsParams` struct
        enum CodingKeys: String, CodingKey {
            case groupId = "group_id"
            case serverId = "server_id"
            case apiVersion = "api_version"
            case messageNew = "message_new"
        }

        public init(groupId: UInt64, serverId: UInt64, apiVersion: ApiVersion, messageNew: VkFlag) {
            self.groupId = groupId
            self.serverId = serverId
            self.apiVersion = apiVersion
            self.messageNew = messageNew
        }
    }

    /**
     Adds Callback API server to the community.
     If succeed returns server ID in server_id field (integer).
     SeeAlso VK API Reference:
     [setCallbackSettings](https://vk.com/dev/groups.setCallbackSettings)
     
     - Parameters:
         - params: Parameters container, see `SetCallbackSettingsParams` struct
     - Throws: Throws on errors
     - Returns: Future of `SetCallbackSettingsResp` type
     */
    @discardableResult
    func setCallbackSettings(params: SetCallbackSettingsParams) throws -> Future<VkFlag> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "groups.setCallbackSettings", params: params, headers: headers)
            .flatMapThrowing { (container) -> VkFlag in
                return try self.processContainer(container)
            }
    }
}
