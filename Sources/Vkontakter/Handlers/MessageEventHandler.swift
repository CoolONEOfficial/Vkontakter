//
//  CallbackQueryHandler.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 23.04.2018.
//

import Foundation

/// Handler for MessageEvent updates
public class MessageEventHandler: Handler {

    public var name: String

    let callback: HandlerCallback

    public init(
        name: String = String(describing: MessageEventHandler.self),
        callback: @escaping HandlerCallback
    ) {
        self.callback = callback
        self.name = name
    }

    public func check(update: Update) -> Bool {
        guard case let .event(event) = update.object else { return false }
        return event.payload != nil
    }

    public func handle(update: Update, dispatcher: Dispatcher) {
        do {
            try callback(update, nil)
        } catch {
            log.error(error.logMessage)
        }
    }
}
