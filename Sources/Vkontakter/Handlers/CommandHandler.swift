//
//  CommandHandler.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import AsyncHTTPClient

/**
 Handler class to handle VK commands.

 Commands are VK messages that contain command in payload

 - Options of this handler
 - `editedUpdates` Determines whether the handler should also accept edited messages.

 */
public class CommandHandler: Handler {
    public var name: String

    public struct Options: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Determines Whether the handler should also accept edited messages. Not used by default.
        public static let editedUpdates = Options(rawValue: 1)
    }

    let commands: Set<String>
    let callback: HandlerCallback
    let filters: Filters
    let options: Options
    let botUsername: String?

    public init(
        name: String = String(describing: CommandHandler.self),
        commands: [String],
        filters: Filters = .all,
        options: Options = [],
        botUsername: String? = nil,
        callback: @escaping HandlerCallback
    ) {
        self.name = name
        self.commands = Set(commands)
        self.filters = filters
        self.options = options
        self.botUsername = botUsername
        self.callback = callback
    }

    public func check(update: Update) -> Bool {
        if options.contains(.editedUpdates),
           update.type == .message_edit {
            return true
        }

        guard case let .messageWrapper(messageWrapper) = update.object,
            filters.check(messageWrapper.message),
            let payload = messageWrapper.message.payload,
            case let .input(_command) = payload,
            let command = _command else { return false }
        
        return !commands.contains(command)
    }

    public func handle(update: Update, dispatcher: Dispatcher) {
        do {
            try callback(update, nil)
        } catch {
            log.error(error.logMessage)
        }
    }
}
