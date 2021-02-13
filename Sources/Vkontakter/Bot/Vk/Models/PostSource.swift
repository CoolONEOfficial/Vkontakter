// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект , описывающий способ размещения ,

 SeeAlso VK API Reference:
 [PostSource](https://vk.com/dev/objects/post_source
 */
public struct PostSource: Codable {
    /// Тип источника.
    public enum `Type`: String, Codable {
        /// vk — запись создана через основной интерфейс сайта (http://vk.
        case vk
    
        /// widget — запись создана через виджет на стороннем сайте;
        case widget
    
        /// rss— запись создана посредством импорта RSS-ленты со стороннего сайта;
        case rss
    
        /// sms — запись создана посредством отправки SMS-сообщения на специальный номер.
        case sms
    
        /// api — запись создана приложением через API;
        case api
    }
    
    public let `type`: Type?
    
    /// Название платформы, если оно доступно.
    public enum Platform: String, Codable {
        /// android;
        case android
    
        /// iphone;
        case iphone
    
        /// wphone.
        case wphone
    }
    
    public let platform: Platform?
    
    /// Тип действия (только для = или ).
    public enum Data: String, Codable {
        /// profile_photo — изменение профильной фотографии пользователя (для type = vk);
        case profile_photo
    
        /// profile_activity — изменение статуса под именем пользователя (для type = vk);
        case profile_activity
    
        /// comments — виджет комментариев (для type = widget);
        case comments
    
        /// like — виджет «Мне нравится» (для type = widget);
        case like
    
        /// poll — виджет опросов (для type = widget);
        case poll
    }
    
    public let data: Data?
    
    /// URL ресурса, с которого была опубликована запись.
    public let url: String?
    
    public init(type: Type? = nil, platform: Platform? = nil, data: Data? = nil, url: String? = nil) {
        self.type = `type`
        self.platform = platform
        self.data = data
        self.url = url
    }

}