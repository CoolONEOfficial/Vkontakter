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
        if let index = lastIndex(of: char) {
            return String(self[index ..< endIndex])
        }
        return nil
    }
    
    func afterLast(_ str: String) -> Self? {
        if let index = lastIndex(of: str) {
            return String(self[index ..< endIndex])
        }
        return nil
    }
}

extension String {
    func indexOf(_ input: String,
                 options: String.CompareOptions = .literal) -> String.Index? {
        return self.range(of: input, options: options)?.lowerBound
    }

    func lastIndex(of input: String) -> String.Index? {
        return indexOf(input, options: .backwards)
    }
}
