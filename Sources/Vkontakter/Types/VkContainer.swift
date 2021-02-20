//
//  VkContainer.swift
//  App
//
//  Created by Nikolai Trukhin on 02.01.2020.
//

/// This object represents a Telegram server response container.
public struct VkContainer<T: Codable>: Codable {

    public struct Error: Codable {
        public var errorCode: Int
        public var errorMsg: String?
        public var requestParams: [Dictionary<String, String>]?
    }
    
    public var error: Error?

    public var response: T?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.response = try? container.decode(T.self, forKey: .response)
        self.error = try? container.decode(Error.self, forKey: .error)
    }
}
