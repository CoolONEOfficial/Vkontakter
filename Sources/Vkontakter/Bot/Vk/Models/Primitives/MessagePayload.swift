//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 27.12.2020.
//

import Foundation

public extension Message {
    struct Payload: Codable {
        
        /// Command
        public enum Command: String {
            case start
        }
        
        public let command: Command?
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let str = try container.decode(String.self)

            let json = try JSONSerialization.jsonObject(with: .init(str.utf8), options: []) as! [String: Any]
            if let command = json["command"] as? String {
                self.command = Command(rawValue: command)
            } else {
                command = nil
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(JSONEncoder.snakeCased.encode(self))
        }

    }
}
