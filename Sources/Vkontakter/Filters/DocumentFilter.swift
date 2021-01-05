//
//  DocumentFilter.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import Foundation

/// Messages that contain `Doc` in attachments
public struct DocumentFilter: Filter {

    public var name: String = "document"

    public func filter(message: Message) -> Bool {
        guard let attachments = message.attachments?.attachments else { return false }
        return attachments.contains { if case .doc = $0 { return true } else { return false } }
    }
}

public extension Filters {
    static var document = Filters(filter: DocumentFilter())
}
