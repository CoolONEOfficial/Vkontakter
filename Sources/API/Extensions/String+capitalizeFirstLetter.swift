//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 28.11.2020.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    func dotsToCapitalize() -> String {
        return replacingOccurrences(of: ".", with: " ")
            .capitalized
            .replacingOccurrences(of: " ", with: "")
    }
}
