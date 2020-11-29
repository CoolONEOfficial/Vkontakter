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
    
    var beforeLastDot: Self? {
        if let dotIndex = lastIndex(of: ".") {
            return String(self[startIndex ... dotIndex])
        }
        return nil
    }
}
