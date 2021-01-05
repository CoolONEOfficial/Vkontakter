//
//  ArrayOrValue.swift
//  
//
//  Created by Nickolay Truhin on 06.01.2021.
//

import Foundation

public struct ArrayOrValue<T: Codable>: Codable {
    public let array: [T]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        array = try (try? container.decode([T].self)) ?? [ try container.decode(T.self) ]
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if array.count == 1 {
            try container.encode(array.first!)
        } else {
            try container.encode(array)
        }
    }
}
