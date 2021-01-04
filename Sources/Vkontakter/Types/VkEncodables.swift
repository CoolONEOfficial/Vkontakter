//
//  TelegramEncodables.swift
//  App
//
//  Created by Givi Pataridze on 07.04.2018.
//

import Foundation
import VkontakterMultipart
import struct NIO.ByteBufferAllocator

/// Represent VK type, which will be encoded as Json on sending to server
protocol JSONEncodable: Encodable {}

extension JSONEncodable {
    func encodeBody() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    var dictionary: [String: String]? {
        guard let data = try? JSONEncoder.snakeCased.encode(self) else { return nil }
        let test = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { dict in
            return dict as? [String: Any]
        }
        let mapped = test?.compactMapValues { val in
            val is Dictionary<AnyHashable, Any>
                ? String(data: try! JSONSerialization.data(withJSONObject: val, options: .fragmentsAllowed), encoding: .utf8)
                : String(describing: val)
        }
        return mapped
    }
}

/// Represent VK type, which will be encoded as multipart/form-data on sending to server
protocol MultipartEncodable: Encodable {}

extension MultipartEncodable {
    func encodeBody(boundary: String) throws -> ByteBuffer {
        let encoder = FormDataEncoder()
        var buffer = ByteBufferAllocator().buffer(capacity: 0)
        try encoder.encode(self, boundary: boundary, into: &buffer)
        return buffer
    }
}
