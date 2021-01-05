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
    // TODO: other kinds
    
    private enum CodingKeys: CodingKey {
        case type
        case photo
        case doc
    }
    
    public enum `Type`: String, Decodable {
        case photo
        case doc
        case audio
        case graffiti
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let type = try container.decode(Type.self, forKey: .type)
        
        switch type {
        case .photo:
            self = .photo(try container.decode(Photo.self, forKey: .photo))
        case .doc:
            self = .doc(try container.decode(Doc.self, forKey: .doc))
        case .audio:
            fatalError()
        case .graffiti:
            fatalError()
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(attachable.attachmentId)
    }

    public var attachable: Attachable {
        let attachable: Attachable
        
        switch self {
        case let .doc(docValue):
            attachable = docValue
        case let .photo(photoValue):
            attachable = photoValue
        }
        
        return attachable
    }
}

public protocol Attachable: Codable {
    /// тип медиавложения:
    var attachmentType: Attachment.`Type` { get }
    
    /// Идентификатор владельца медиавложения (обратите внимание, если объект находится в сообществе, этот параметр должен быть отрицательным).
    var ownerId: Int64? { get }
    
    /// идентификатор медиавложения.
    var mediaId: Int64? { get }
}

public extension Attachable {
    var attachmentId: String {
        "\(attachmentType)\(ownerId ?? 0)_\(mediaId ?? 0)"
    }
}

extension Doc: Attachable {
    public var attachmentType: Attachment.`Type` {
        .doc
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Photo: Attachable {
    public var attachmentType: Attachment.`Type` {
        .photo
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Bot.Photo: Attachable {
    public var attachmentType: Attachment.`Type` {
        .photo
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Graffiti: Attachable {
    public var attachmentType: Attachment.`Type` {
        .graffiti
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Audio: Attachable {
    public var attachmentType: Attachment.`Type` {
        .audio
    }
    
    public var mediaId: Int64? {
        id
    }
}
