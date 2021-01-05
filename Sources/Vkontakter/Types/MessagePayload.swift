//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 27.12.2020.
//

import Foundation
import AnyCodable

public extension Message {
    enum Payload: Codable {
        /// Command
        public enum Command: String {
            case start
        }
        
        case input(Command?)
        case output(AnyCodable?, encoder: JSONEncoder = .snakeCased)
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let str = try container.decode(String.self)

            let json = try JSONSerialization.jsonObject(with:  .init(str.utf8), options: []) as! [String: Any]
            let command: Command?
            if let commandValue = json["command"] as? String {
                command = Command(rawValue: commandValue)
            } else {
                command = nil
            }
            
            self = .input(command)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case let .input(command):
                try container.encode(command?.rawValue)
            case let .output(object, encoder):
                try container.encode(encoder.encode(object))
            }
        }
    }

}
