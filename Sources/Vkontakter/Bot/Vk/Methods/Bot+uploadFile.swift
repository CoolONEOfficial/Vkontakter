//
//  Bot+uploadFile.swift
//
//
//  Created by Nickolay Truhin on 05.01.2021.
//

import Foundation

public extension Bot {

    /// Parameters container struct for `setCallbackSettings` method
    final class UploadFileParams: MultipartEncodable {
        
        ///
        let file: InputFile

        public init(_ file: InputFile) {
            self.file = file
        }

    }
    
    final class UploadFileResp: Codable {
        
        ///
        public let file: String

    }

    @discardableResult
    func uploadFile(to url: URL, params: UploadFileParams) throws -> Future<UploadFileResp> {
        let body = try httpBody(for: params)
        let headers = httpHeaders(for: params)
        return try client
            .request(url: url, body: body, headers: headers)
    }
}
