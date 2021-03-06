//
//  Dispatcher.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 09.04.2018.
//

import Dispatch
import Foundation
import NIO
import Logging
import AsyncHTTPClient

/**
 This class dispatches all kinds of updates to its registered handlers.
 It supports handlers for different kinds of data: Updates from Telegram, basic text commands and even arbitrary types.
 */
public class Dispatcher {

    /// Telegram bot instance
    public let bot: Bot

    /// Queue in which passes all incoming updates
    public let updateQueue: DispatchQueue

    /// Worker which handle updates with appropriate handlers. Uses all available CPU cores by default.
    public let worker: Worker

    /// Queue which keep all added handlers and gives appropriates
    public var handlersQueue: HandlersQueue
    
    private var prevData: Data?

    public init(bot: Bot, worker: Worker = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)) {
        self.bot = bot
        self.worker = worker
        self.updateQueue = DispatchQueue(
            label: "VKONT-UPDATES-QUEUE",
            qos: .default,
            attributes: .concurrent,
            autoreleaseFrequency: .inherit,
            target: nil
        )
        self.handlersQueue = HandlersQueue()
    }

    /**
     Enqueue new updates array to Updates queue

     - Parameters:
     - updates: Array of Telegram updates
     */
    public func enqueue(updates: [Update]) {
        updates.forEach { (update) in
            updateQueue.async {
                guard self.bot.checkSecretKey(with: update.secret) else {
                    debugPrint("Wrong secret key, ignoring")
                    return
                }
                self.submit(update: update)
            }
        }
    }

    /**
     Enqueue update as ByteBuffer to Updates queue

     - Parameters:
     - bytebuffer: Array of Telegram updates
     */
    @discardableResult
    public func enqueue(bytebuffer: ByteBuffer) -> Update? {
        guard let dataArr = bytebuffer.getBytes(at: 0, length: bytebuffer.writerIndex) else {
            return nil
        }
        let data = Data(dataArr)

        if let update = enqueue(from: data) {
            return update
        } else if let prevData = prevData, let update = enqueue(from: prevData + data) {
            return update
        } else {
            if prevData != nil {
                prevData?.append(data)
            } else {
                prevData = Data(data)
            }
            return nil
        }
    }

    private func enqueue(from data: Data) -> Update? {
        if let update = try? JSONDecoder.snakeCased.decode(Update.self, from: data) {
            guard update.type != .confirmation else { return update }
            enqueue(updates: [ update ])
            prevData = nil
            return update
        }
        return nil
    }
}

public extension Dispatcher {
    /**
     Add new handler to group
     
     - Parameters:
     - handler: Handler to add in `Dispatcher`'s handlers queue
     - group: Group of `Dispatcher`'s handler queue, `zero` group by default
     */
    func add(handler: Handler, to group: HandlerGroup = .zero) {
        handlersQueue.add(handler, to: group)
    }

    /**
     Remove handler from specific group of `Dispatchers`'s queue
     
     Note: If in one group present more then one handlers with the same name, they both will be deleted
     
     - Parameters:
     - handler: Handler to be removed
     - group: Group from which handlers will be removed
     */
    func remove(handler: Handler, from group: HandlerGroup) {
        handlersQueue.remove(handler, from: group)
    }
}

private extension Dispatcher {
    func submit(update: Update) {
        handlersQueue.next(for: update).forEach { (handler) in
            worker.next().execute {
                handler.handle(update: update, dispatcher: self)
            }
        }
    }
}
