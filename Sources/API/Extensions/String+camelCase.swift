//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 28.11.2020.
//

import Foundation

fileprivate let badChars = CharacterSet.alphanumerics.inverted

extension String {
    fileprivate var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }

    fileprivate var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }

    var camelized: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: badChars)

        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})

        return ([first] + rest).joined(separator: "")
    }
}
