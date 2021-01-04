//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 02.12.2020.
//

import Foundation

public enum Attachment: Codable {

    case photo(Photo)
    case doc(Doc)
    
    private enum CodingKeys: CodingKey {
        case type
        case photo
        case doc
    }
    
    private enum `Type`: String, Decodable {
        case photo
        case doc
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let type = try container.decode(Type.self, forKey: .type)
        
        switch type {
        case .photo:
            self = .photo(try container.decode(Photo.self, forKey: .photo))
        case .doc:
            self = .doc(try container.decode(Doc.self, forKey: .doc))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        let type: Type
        let id: Int64?
        let ownerId: Int64?
        
        switch self {
        case let .doc(docValue):
            type = .doc
            id = docValue.id
            ownerId = docValue.ownerId
        case let .photo(photoValue):
            type = .photo
            id = photoValue.id
            ownerId = photoValue.ownerId
        }
        
        try container.encode("\(type.rawValue)\(ownerId ?? 0)_\(id ?? 0)")
    }

}
