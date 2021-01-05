//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 05.01.2021.
//

import Foundation

public extension Bot {
    enum SavedDoc: Codable {
        case graffiti(Graffiti)
        case audio(Audio)
        case doc(Doc)
        case photo(Bot.Photo)
        
        private enum CodingKeys: CodingKey {
            case type
            case graffiti
            case audio_message
            case doc
        }
        
        enum `Type`: String, Decodable {
            case graffiti
            case audio_message
            case doc
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let type = try container.decode(`Type`.self, forKey: .type)
            switch type {
            case .graffiti:
                self = .graffiti(try container.decode(Graffiti.self, forKey: .graffiti))
            case .audio_message:
                self = .audio(try container.decode(Audio.self, forKey: .audio_message))
            case .doc:
                self = .doc(try container.decode(Doc.self, forKey: .doc))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            switch self {
            case let .graffiti(graffiti):
                try container.encode(graffiti, forKey: .graffiti)
            case let .audio(audio):
                try container.encode(audio, forKey: .audio_message)
            case let .doc(doc):
                try container.encode(doc, forKey: .doc)
            case .photo: break // nope
            }
        }
        
        public var attachable: Attachable {
            let attachable: Attachable
            
            switch self {
            case let .doc(docValue):
                attachable = docValue
            case let .photo(photoValue):
                attachable = photoValue
            case let .audio(audioValue):
                attachable = audioValue
            case let .graffiti(graffitiValue):
                attachable = graffitiValue
            }
            
            return attachable
        }
    }
}
