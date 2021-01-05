// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

public extension Bot {

    /// Parameters container struct for `saveDoc` method
    final class SaveDocParams: JSONEncodable {

        /// Параметр, возвращаемый в результате загрузки файла на сервер.
        public let file: String
        
        /// Название документа.
        public let title: String?
        
        /// Метки для поиска.
        public let tags: String?
        
        public let returnTags: VkFlag?
        
        public init(file: String, title: String? = nil, tags: String? = nil, returnTags: VkFlag? = nil) {
            self.file = file
            self.title = title
            self.tags = tags
            self.returnTags = returnTags
        }
    
    }
    
    /**
     Сохраняет документ после его успешной загрузки на сервер.
     После успешного выполнения возвращает массив объектов, описывающих загруженные документы.

     See also VK API Reference:
     [SaveDoc](https://vk.com/dev/docs.save)
     
     - Parameters:
         - params: Parameters container, see `SaveDocParams` struct
     - Throws: Throws on errors
     - Returns: Future of `ArrayOrValue<SavedDoc>` type
     */
    @discardableResult
    func saveDoc(params: SaveDocParams) throws -> Future<ArrayOrValue<SavedDoc>> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "docs.save", params: params, headers: headers)
            .flatMapThrowing { (container) -> ArrayOrValue<SavedDoc> in
                return try self.processContainer(container)
        }
    }
}