//
//  Bot+getCallbackConfirmationCode.swift
//
//
//  Created by Nickolay Truhin on 27.11.2020.
//

public extension Bot {

    /// Parameters container struct for `groups.getCallbackConfirmationCode` method
    struct GetCallbackConfirmationCodeParams: JSONEncodable {

        /// Vk target group id
        var groupId: UInt64

        /// Custom keys for coding/decoding `GetCallbackConfirmationCodeParams` struct
        enum CodingKeys: String, CodingKey {
            case groupId = "group_id"
        }

        public init(groupId: UInt64) {
            self.groupId = groupId
        }
    }
    
    struct GetCallbackConfirmationCodeResp: Codable {
        public let code: String
    }

    /**
     Returns Callback API confirmation code for the community.
     To add or edit the server please use groups.addCallbackServer or groups.editCallbackServer methods.
     Returns a string with the confirmation code.
     SeeAlso VK API Reference:
     [getCallbackConfirmationCode](https://vk.com/dev/groups.getCallbackConfirmationCode)
     
     - Parameters:
         - params: Parameters container, see `GetCallbackConfirmationCodeParams` struct
     - Throws: Throws on errors
     - Returns: Future of `GetCallbackConfirmationCodeResp` type
     */
    @discardableResult
    func getCallbackConfirmationCode(params: GetCallbackConfirmationCodeParams) throws -> Future<GetCallbackConfirmationCodeResp> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "groups.getCallbackConfirmationCode", params: params, headers: headers)
            .flatMapThrowing { (container) -> GetCallbackConfirmationCodeResp in
                return try self.processContainer(container)
            }
    }
}
