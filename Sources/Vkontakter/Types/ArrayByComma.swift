//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 13.02.2021.
//

import Foundation

public struct ArrayByComma<Element: Codable>: Codable, ExpressibleByArrayLiteral {

    public let array: [Element]
    
    public init(_ array: [Element]) {
        self.array = array
    }
    
    // MARK: 
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let res = try array.compactMap {
            String(data: try JSONEncoder.snakeCased.encode($0), encoding: .utf8)?.trimmingCharacters(in: ["\""])
        }.joined(separator: ",")
        try container.encode(res)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        array = try container.decode([Element].self)
    }
    
    // MARK: ExpressibleByArrayLiteral
    
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: Self.ArrayLiteralElement...) {
        self.array = elements
    }

}

extension ArrayByComma: ExpressibleByIntegerLiteral where Element == Int64 {

    public typealias IntegerLiteralType = Int64

    public init(integerLiteral value: Self.IntegerLiteralType) {
        self.init([ value ])
    }
    
    public init(_ int: Self.IntegerLiteralType) {
        self.init(integerLiteral: int)
    }

}
