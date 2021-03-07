//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 07.03.2021.
//

import Foundation

public enum IdOrUsername {
    case id(Int64)
    case username(String)
}

extension IdOrUsername: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let id = try? container.decode(Int64.self) {
            self = .id(id)
        } else if let str = try? container.decode(String.self) {
            self = .username(str)
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "There is no int or string")
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = try encoder.singleValueContainer()
        switch self {
        case let .id(id):
            try container.encode(id)
        case let .username(username):
            try container.encode(username)
        }
    }
}
