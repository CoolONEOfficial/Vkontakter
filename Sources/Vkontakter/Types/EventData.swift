//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 24.12.2020.
//

import Foundation

public enum EventData: Codable {
    public struct Snackbar: Codable {
        enum CodingKeys: CodingKey {
            case type, text
        }
        
        let type = "show_snackbar"
        
        /// текст, который нужно вывести (максимум 90 символов). Snackbar показывается в течение 10 секунд и автоматически скрывается, при этом у пользователя есть возможность смахнуть его с экрана.
        let text: String
        
        public init(text: String) {
            self.text = text
        }
    }
    
    public struct Link: Codable {
        enum CodingKeys: CodingKey {
            case type, link
        }
        
        let type = "open_link"
        
        /// адрес по которому осуществится переход.
        public let link: String
        
        public init(link: String) {
            self.link = link
        }
    }
    
    public struct App: Codable {
        enum CodingKeys: CodingKey {
            case type, appId, ownerId, hash
        }
        
        let type = "open_app"

        let appId: Int64

        let ownerId: Int64?

        let hash: String
        
        public init(appId: Int64, ownerId: Int64? = nil, hash: String) {
            self.appId = appId
            self.ownerId = ownerId
            self.hash = hash
        }
    }

    case snackbar(Snackbar)
    case link(Link)
    case app(App)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let snackValue = try? container.decode(Snackbar.self) {
            self = .snackbar(snackValue)
        } else if let linkValue = try? container.decode(Link.self) {
            self = .link(linkValue)
        } else if let appValue = try? container.decode(App.self) {
            self = .app(appValue)
        }
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Data doesn't match"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .snackbar(snackValue):
            return try container.encode(snackValue)
        case let .link(linkValue):
            return try container.encode(linkValue)
        case let .app(appValue):
            return try container.encode(appValue)
        }
    }
}
