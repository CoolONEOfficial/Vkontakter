//
//  Bot+upload.swift
//  
//
//  Created by Nickolay Truhin on 04.01.2021.
//

import Foundation

public extension Bot {
    enum Destination {
        case message
    }
    
    enum UploadError: Error {
        case invalidUploadServerUrl
    }
    
    @discardableResult
    func upload(_ file: InputFile, for destination: Destination) throws -> Future<[Photo]> {
        switch destination {
        case .message:
            let test = try getMessagesUploadServer(params: .init(peerId: 0))
            return test.flatMap { serverResp in
                guard let uploadUrl = URL(string: serverResp.uploadUrl) else {
                    return test.eventLoop.makeFailedFuture(UploadError.invalidUploadServerUrl)
                }
                
                return try! self.uploadPhoto(to: uploadUrl, params: .init(file)).flatMap { uploadResp in
                    try! self.saveMessagesPhoto(params: uploadResp.saveParams)
                }
            }
        }
    }
}
