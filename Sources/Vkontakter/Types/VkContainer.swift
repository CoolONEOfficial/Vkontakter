//
//  TelegramContainer.swift
//  App
//
//  Created by Givi Pataridze on 25.02.2018.
//

/// This object represents a Telegram server response container.
public struct VkContainer<T: Codable>: Codable {

    public struct Error: Codable {
        public var errorCode: Int
        public var errorMessage: String?
        public var requestParams: [Dictionary<String, String>]?
    }
    
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        error = try? values.decode(Error.self, forKey: .error)
//        if error == nil {
//           // let val = try decoder.container(keyedBy: CK.self)
//            result = try .init(from: decoder)
//        }
//    }
    
    public var error: Error?
    
//    enum CodingKeys: String, CodingKey {
//        case ok = "ok"
//        case result = "result"
//        case description = "description"
//        case errorCode = "error_code"
//        case parameters = "parameters"
//    }
//
//    public var ok: Bool
    public var response: T?
    
    public var ok: Bool {
        error == nil
    }
//    public var description: String?
//
//    public var parameters: ResponseParameters?

//    public init (ok: Bool, result: T?, description: String?, errorCode: Int?, parameters: ResponseParameters?) {
//        self.ok = ok
//        self.result = result
//        self.description = description
//        self.errorCode = errorCode
//        self.parameters = parameters
//    }
}
