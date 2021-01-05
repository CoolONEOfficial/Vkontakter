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
    
    enum UploadType {
        case photo
        case doc(peerId: Int64)
    }

    enum UploadError: Error {
        case invalidUploadServerUrl
    }
    
    @discardableResult
    func upload(_ file: InputFile, as type: UploadType, for destination: Destination) throws -> Future<[SavedDoc]> {
        switch destination {
        case .message:
            switch type {
            case .photo:
                let future = try getMessagePhotosUploadServer(params: .init(peerId: 0))
                return future.flatMap { serverResp in
                    guard let uploadUrl = URL(string: serverResp.uploadUrl) else {
                        return future.eventLoop.makeFailedFuture(UploadError.invalidUploadServerUrl)
                    }
                    return try! self.uploadPhoto(to: uploadUrl, params: .init(file)).flatMap { uploadResp in
                        try! self.saveMessagesPhoto(params: uploadResp.saveParams).map { $0.map { photo in SavedDoc.photo(photo) } }
                    }
                }
            case let .doc(peerId):
                let future = try getMessageDocsUploadServer(params: .init(peerId: peerId))
                return future.flatMap { serverResp in
                    guard let uploadUrlStr = serverResp.uploadUrl, let uploadUrl = URL(string: uploadUrlStr) else {
                        return future.eventLoop.makeFailedFuture(UploadError.invalidUploadServerUrl)
                    }
                    return try! self.uploadFile(to: uploadUrl, params: .init(file)).flatMap { uploadResp in
                        try! self.saveDoc(params: .init(file: uploadResp.file, title: file.filename)).map { $0.array }
                    }
                }
            }
        }
    }
}
