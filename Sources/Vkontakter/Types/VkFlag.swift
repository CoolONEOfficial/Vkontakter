//
//  VkFlag.swift
//  
//
//  Created by Nickolay Truhin on 29.11.2020.
//

import Foundation

public enum VkFlag: UInt8, Codable {
    case on = 1
    case off = 0
    
    public var bool: Bool {
        self == .on
    }
}
