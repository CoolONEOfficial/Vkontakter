//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 03.01.2021.
//

import Foundation

extension String {
    func afterLastText(_ searchText: String) -> SubSequence? {
        afterLast(searchText)?.dropFirst(searchText.count)
    }
}
