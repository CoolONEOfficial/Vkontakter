//
//  PhotoFilter.swift
//  Telegrammer
//
//  Created by Nikolai Trukgin on 05.01.2021.
//

import Foundation

/// Messages that contain `Photo` in attachments
public struct PhotoFilter: Filter {

    public var name: String = "photo"

    public func filter(message: Message) -> Bool {
        guard let attachments = message.attachments?.array else { return false }
        return attachments.contains { if case .photo = $0 { return true } else { return false } }
    }
}

public extension Filters {
    static var photo = Filters(filter: PhotoFilter())
}
