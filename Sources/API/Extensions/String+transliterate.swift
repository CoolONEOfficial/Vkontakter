//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 29.11.2020.
//

import Foundation

extension String {
    var transliterate: String {
        let okayChars = Set("_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        let str = applyingTransform(.toLatin, reverse: false)?
            .applyingTransform(.stripDiacritics, reverse: false)?
            .lowercased()
            .replacingOccurrences(of: " ", with: "_")
            .replacingOccurrences(of: "/", with: "_")
            .filter {okayChars.contains($0) } ?? self
        return str.first?.isNumber ?? false ? "_" + str : str
    }
}
