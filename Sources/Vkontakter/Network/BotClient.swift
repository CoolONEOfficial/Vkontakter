//
//  RequestManager.swift
//  TelegrammerPackageDescription
//
//  Created by Givi Pataridze on 25.02.2018.
//

import Foundation
import NIO
import NIOHTTP1
import AsyncHTTPClient

public class BotClient {

    let host: String
    let token: String
    let apiVersion: String = "5.126"
    var client: HTTPClient

    /// Default init for BotClient (HTTP client), all parameters except `proxy` are oblibatory
    /// - Parameters:
    ///   - host: Host for requests (without scheme)
    ///   - port: Port for requests
    ///   - token: Bot auth token
    ///   - worker: Worker on which will be performed request
    ///   - proxy: Proxy parameters
    public init(
        host: String,
        token: String,
        worker: HTTPClient.EventLoopGroupProvider,
        proxy: HTTPClient.Configuration.Proxy? = nil
    ) throws {
        self.host = host
        self.token = token
        let config = HTTPClient.Configuration(
            certificateVerification: .fullVerification,
            proxy: proxy
        )
        self.client = HTTPClient(eventLoopGroupProvider: worker, configuration: config)
    }

    /// Sends request to api.telegram.org, and receive TelegramContainer object
    ///
    /// - Parameters:
    ///   - endpoint: Telegram method endpoint
    ///   - body: Body of request (optional)
    ///   - headers: Custom header of request (By default "Content-Type" : "application/json")
    ///   - client: custom client, if not metioned, uses default
    /// - Returns: Container with response
    /// - Throws: Errors
    func request<T: Codable>(
        endpoint: String,
        params: Encodable? = nil,
        headers: HTTPHeaders = .empty
    ) throws -> Future<VkContainer<T>> {
        let url = apiUrl(endpoint: endpoint, params: params)
        let request = try HTTPClient.Request(
            url: url,
            method: .POST,
            headers: headers,
            body: nil
        )

        log.info("Sending request:\n\(request.description)")

        return client
            .execute(request: request)
            .flatMapThrowing({ (response) -> VkContainer<T> in
                let test: VkContainer<T> = try self.decode(response: response)
                return test
            })
    }

    func decode<T: Encodable>(response: HTTPClient.Response) throws -> VkContainer<T> {
        guard let body = response.body else {
            throw BotError()
        }
        guard let bytes = body.getBytes(at: 0, length: body.writerIndex) else {
            throw BotError()
        }
        debugPrint("try to decode \(String.init(data: Data(bytes), encoding: .utf8))")
        return try JSONDecoder().decode(VkContainer<T>.self, from: Data(bytes))
    }

    func apiUrl(endpoint: String, params: Encodable?) -> URL {
        let paramsDict = (params as? JSONEncodable)?.dictionary ?? .init()
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/method/\(endpoint)"
        let query = ["v": apiVersion, "access_token": token]
        components.queryItems = query
            .merging(paramsDict) { _, new in new }
            .map { .init(name: $0.key, value: $0.value) }

        return components.url!
    }
}

extension HTTPClient.Body {
    static var empty: HTTPClient.Body {
        return .string("")
    }
}
