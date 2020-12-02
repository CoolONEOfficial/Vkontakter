//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 29.11.2020.
//

import Foundation

extension String {
    var firstSentence: Self? {
        if let dotIndex = firstIndex(of: ".") {
            return String(self[startIndex ... dotIndex])
        }
        return nil
    }
    
    var beforeLastDotOrComma: Self {
        beforeLast(".") ?? beforeLast(",") ?? self
    }
    
    func beforeLast(_ char: Character) -> Self? {
        if let dotIndex = lastIndex(of: char) {
            return String(self[startIndex ... dotIndex])
        }
        return nil
    }
    
    func afterLast(_ char: Character) -> Self? {
        if let dotIndex = lastIndex(of: char) {
            return String(self[dotIndex ..< endIndex])
        }
        return nil
    }
}
