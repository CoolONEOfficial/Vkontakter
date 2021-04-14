//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 29.11.2020.
//

import Foundation
#if os(Linux)
    import CoreFoundation
    import Glibc
#endif

extension String {
    var transliterate: String {
        let okayChars = Set("_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        
        let chars = Array(self.utf16)
        let cfStr = CFStringCreateWithCharacters(nil, chars, self.utf16.count)
        let str = CFStringCreateMutableCopy(nil, 0, cfStr)!
        if CFStringTransform(str, nil, kCFStringTransformToLatin, false) {
            if CFStringTransform(str, nil, kCFStringTransformStripDiacritics, false) {
                let str = String(describing: str)
                    .replacingOccurrences(of: " ", with: "_")
                    .replacingOccurrences(of: "/", with: "_")
                    .filter {okayChars.contains($0) }

                return str.first?.isNumber ?? false ? "_" + str : str
            }
        }
        return self
    }
}
