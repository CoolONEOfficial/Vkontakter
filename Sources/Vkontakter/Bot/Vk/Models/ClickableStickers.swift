// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Список объектов › Кликабельный стикер в истории Объект, описывающий кликабельный стикер. В объекте истории доступно поле clickable_stickers. Объект стикера вклеивается разработчиком на клиенте самостоятельно, на сервер передаются только координаты. 1. Поля объекта clickable_stickers 2. Общие поля для всех типов стикеров 3. Поля, в зависимости от типа стикера

 SeeAlso VK API Reference:
 [ClickableStickers](https://vk.com/dev/objects/clickable_stickers
 */
public struct ClickableStickers: Codable {
    /// Содержит строку в формате упоминания ВКонтакте, например: [id1|name] или [club1|name].
    public let mention: String?
    
    public init(mention: String? = nil) {
        self.mention = mention
    }

}