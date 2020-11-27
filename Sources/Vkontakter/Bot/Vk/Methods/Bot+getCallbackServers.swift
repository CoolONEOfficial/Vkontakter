//
//  Bot+getCallbackServers.swift
//
//
//  Created by Nickolay Truhin on 27.11.2020.
//

public extension Bot {

    /// Parameters container struct for `groups.getCallbackServers` method
    struct GetCallbackServersParams: JSONEncodable {

        /// Vk target group id
        var groupId: UInt64

        /// Custom keys for coding/decoding `GetCallbackServersParams` struct
        enum CodingKeys: String, CodingKey {
            case groupId = "group_id"
        }

        public init(groupId: UInt64) {
            self.groupId = groupId
        }
    }
    
    struct GetCallbackServersResp: Codable {
        public struct Item: Codable {
            /// Custom keys for coding/decoding `Item` struct
            enum CodingKeys: String, CodingKey {
                case secretKey = "secret_key"
                case url = "url"
                case status = "status"
                case id = "id"
            }
            
            public enum Status: String, Codable {
                case ok
                case unconfigured
                case failed
                case wait
            }
            
            public let secretKey: String
            public let url: String
            public let status: Status
            public let id: UInt64
        }

        public let items: [Item]
    }

    /**
     Receives a list of Callback API servers from the community.
     Returns the total number of servers in the count (integer) field and an array of the objects describing servers in the items field.
     SeeAlso VK API Reference:
     [getCallbackServers](https://vk.com/dev/groups.getCallbackServers)
     
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
