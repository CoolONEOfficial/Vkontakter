//
//  CommandFilter.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import Foundation

/// Messages which contains command
public struct CommandFilter: Filter {

    public var name: String = "command"

    public func filter(message: Message) -> Bool {
        guard let payload = message.payload else { return false }
        return payload.command != nil
    }
}

public extension Filters {
    static var command = Filters(filter: CommandFilter())
}
