//
//  Bot+uploadPhoto.swift
//  
//
//  Created by Nickolay Truhin on 04.01.2021.
//

import Foundation

public extension Bot {

    /// Parameters container struct for `setCallbackSettings` method
    final class UploadPhotoParams: MultipartEncodable {
        
        ///
        let photo: InputFile

        public init(_ photo: InputFile) {
            self.photo = photo
        }

    }
    
    final class UploadPhotoResp: Codable {
        
        ///
        public let server: Int64
        
        ///
        public let photo: String
        
        ///
        public let hash: String

        public init(server: Int64, photo: String, hash: String) {
            self.server = server
            self.photo = photo
            self.hash = hash
        }
        
        var saveParams: SaveMessagesPhotoParams {
            .init(photo: photo, server: server, hash: hash)
        }
    }

    @discardableResult
    func uploadPhoto(to url: URL, params: UploadPhotoParams) throws -> Future<UploadPhotoResp> {
        let body = try httpBody(for: params)
        let headers = httpHeaders(for: params)
        return try client
            .request(url: url, body: body, headers: headers)
    }
}
