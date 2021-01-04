//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 04.01.2021.
//

import Foundation

public struct Attachments: JSONEncodable {
    let attachments: [Attachment]
    
    public init(_ attachments: [Attachment]) {
        self.attachments = attachments
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let res = try attachments.compactMap {
            String(data: try JSONEncoder.snakeCased.encode($0), encoding: .utf8)?.trimmingCharacters(in: ["\""])
        }.joined(separator: ",")
        try container.encode(res)
    }
}
