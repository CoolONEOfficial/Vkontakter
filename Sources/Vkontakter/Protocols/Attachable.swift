//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 06.01.2021.
//

import Foundation

public protocol Attachable: Codable {
    /// тип медиавложения:
    static var attachmentType: Attachment.`Type` { get }
    
    /// Идентификатор владельца медиавложения (обратите внимание, если объект находится в сообществе, этот параметр должен быть отрицательным).
    var ownerId: Int64? { get }
    
    /// идентификатор медиавложения.
    var mediaId: Int64? { get }
    
    init?(from attachableId: String)
    init(ownerId: Int64, mediaId: Int64?)
}

public extension Attachable {
    var attachmentId: String {
        "\(Self.attachmentType)\(ownerId ?? 0)_\(mediaId ?? 0)"
    }
    
    init?(from attachableId: String) {
        let type = Self.attachmentType.rawValue
        var attachableId = attachableId

        guard type == attachableId.prefix(type.count) else { return nil }
        attachableId = .init(attachableId.dropFirst(type.count))

        let comps = attachableId.components(separatedBy: "_")
        guard comps.count == 2,
              let ownerId = Int64(comps[0]),
              let mediaId = Int64(comps[1]) else { return nil }

        self.init(ownerId: ownerId, mediaId: mediaId)
    }
}

extension Doc: Attachable {
    public convenience init(ownerId: Int64, mediaId: Int64?) {
        self.init(id: mediaId, ownerId: ownerId)
    }
    
    static public var attachmentType: Attachment.`Type` {
        .doc
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Photo: Attachable {
    public convenience init(ownerId: Int64, mediaId: Int64?) {
        self.init(id: mediaId, ownerId: ownerId)
    }
    
    static public var attachmentType: Attachment.`Type` {
        .photo
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Bot.Photo: Attachable {
    public convenience init(ownerId: Int64, mediaId: Int64?) {
        self.init(id: mediaId, ownerId: ownerId)
    }
    
    static public var attachmentType: Attachment.`Type` {
        .photo
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Graffiti: Attachable {
    public convenience init(ownerId: Int64, mediaId: Int64?) {
        self.init(id: mediaId, ownerId: ownerId)
    }
    
    static public var attachmentType: Attachment.`Type` {
        .graffiti
    }
    
    public var mediaId: Int64? {
        id
    }
}

extension Audio: Attachable {
    public convenience init(ownerId: Int64, mediaId: Int64?) {
        self.init(id: mediaId, ownerId: ownerId)
    }
    
    static public var attachmentType: Attachment.`Type` {
        .audio
    }
    
    public var mediaId: Int64? {
        id
    }
}
