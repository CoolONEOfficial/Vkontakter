//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 29.11.2020.
//

import Foundation

extension String {
    func i(_ tabs: Int) -> String {
        replacingOccurrences(of: "\n", with: "\n" + .init(repeating: " ", count: 4 * tabs))
    }
}
