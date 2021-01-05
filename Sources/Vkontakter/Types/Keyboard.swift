//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 03.12.2020.
//

import Foundation
import AnyCodable

public struct Keyboard: Codable {

    ///
    public let oneTime: Bool
    
    ///
    public let buttons: [[Button]]
    
    ///
    public let inline: Bool
    
    public init(oneTime: Bool, buttons: [[Button]], inline: Bool) {
        self.oneTime = oneTime
        self.buttons = buttons
        self.inline = inline
    }
}
