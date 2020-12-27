// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий подарок,

 SeeAlso VK API Reference:
 [Gift](https://vk.com/dev/objects/gift
 */
public final class Gift: Codable {
    /// Идентификатор подарка.
    public let id: Int64?
    
    /// URL изображения 256x256px.
    public let thumb256: String?
    
    /// URL изображения 96x96px.
    public let thumb96: String?
    
    /// URL изображения 48x48px.
    public let thumb48: String?
    
    public init(id: Int64? = nil, thumb256: String? = nil, thumb96: String? = nil, thumb48: String? = nil) {
        self.id = id
        self.thumb256 = thumb256
        self.thumb96 = thumb96
        self.thumb48 = thumb48
    }

}