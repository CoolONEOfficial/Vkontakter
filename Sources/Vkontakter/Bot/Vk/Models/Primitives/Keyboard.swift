//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 03.12.2020.
//

import Foundation

public struct Keyboard: Codable {

    ///
    public let oneTime: Bool
    
    public struct Button: Codable {
        
        public enum Action: Codable {

            public struct Text: Codable {
                
                enum CodingKeys: CodingKey {
                    case type, payload, label
                }
                
                let type = "text"
                
                let payload: String?
                
                let label: String
                
                public init(payload: String? = nil, label: String) {
                    self.payload = payload
                    self.label = label
                }
                
            }
            
            public struct Link: Codable {
                enum CodingKeys: CodingKey {
                    case type, payload, label, link
                }
                
                let type = "open_link"
                
                public let payload: String?
                
                public let label: String
                
                public let link: String
                
                public init(payload: String? = nil, label: String, link: String) {
                    self.payload = payload
                    self.label = label
                    self.link = link
                }
            }
            
            public struct Location: Codable {
                enum CodingKeys: CodingKey {
                    case type, payload
                }
                
                let type = "location"
                
                public let payload: String?
                
                public init(payload: String? = nil) {
                    self.payload = payload
                }
            }
            
            public struct Pay: Codable {
                enum CodingKeys: CodingKey {
                    case type, payload, hash
                }
                
                let type = "vkpay"
                
                public let payload: String?
                
                public let hash: String
                
                public init(payload: String? = nil, hash: String) {
                    self.payload = payload
                    self.hash = hash
                }
            }
            
            public struct App: Codable {
                enum CodingKeys: String, CodingKey {
                    case type, payload, label, appId = "app_id", ownerId = "owner_id", hash
                }
                
                let type = "open_app"
                
                public let payload: String?
                
                public let label: String
                
                public let appId: Int
                
                public let ownerId: Int?
                
                public let hash: String

                public init(payload: String? = nil, label: String, appId: Int, ownerId: Int? = nil, hash: String) {
                    self.payload = payload
                    self.label = label
                    self.appId = appId
                    self.ownerId = ownerId
                    self.hash = hash
                }
            }
            
            public struct Callback: Codable {
                enum CodingKeys: CodingKey {
                    case type, payload, label
                }
                
                let type = "callback"
                
                public let payload: String?
                
                public let label: String

                public init(payload: String? = nil, label: String) {
                    self.payload = payload
                    self.label = label
                }
            }
            
            case text(Text)
            case link(Link)
            case location(Location)
            case pay(Pay)
            case app(App)
            case callback(Callback)
            
            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                
                if let textValue = try? container.decode(Text.self) {
                    self = .text(textValue)
                } else if let linkValue = try? container.decode(Link.self) {
                    self = .link(linkValue)
                } else if let locationValue = try? container.decode(Location.self) {
                    self = .location(locationValue)
                } else  if let payValue = try? container.decode(Pay.self) {
                    self = .pay(payValue)
                } else  if let appValue = try? container.decode(App.self) {
                    self = .app(appValue)
                } else  if let callbackValue = try? container.decode(Callback.self) {
                    self = .callback(callbackValue)
                }
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Data doesn't match"))
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case let .text(textValue):
                    return try container.encode(textValue)
                case let .link(linkValue):
                    return try container.encode(linkValue)
                case let .location(locationValue):
                    return try container.encode(locationValue)
                case let .pay(payValue):
                    return try container.encode(payValue)
                case let .app(appValue):
                    return try container.encode(appValue)
                case let .callback(callbackValue):
                    return try container.encode(callbackValue)
                }
            }
            
        }
        
        ///
        public let action: Action

        public enum Color: String, Codable {
            case primary
            case secondary
            case negative
            case positive
        }
        
        ///
        public let color: Color?

        public init(action: Action, color: Color? = nil) {
            self.action = action
            self.color = color
        }
    }
    
    ///
    public let buttons: [[Button]]
    
    ///
    public let inline: Bool
    
    public init(oneTime: Bool, buttons: [[Keyboard.Button]], inline: Bool) {
        self.oneTime = oneTime
        self.buttons = buttons
        self.inline = inline
    }
}
