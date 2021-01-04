//
//  Template.swift
//  
//
//  Created by Nickolay Truhin on 03.12.2020.
//

import Foundation

/// Боты могут отправлять специальные сообщения, используя шаблоны. Такие сообщения отличаются от обычных как по внешнему виду, так и по функциональности. На данный момент поддерживается один шаблон — карусель.
public enum Template: Codable {

    /// Карусель — это шаблон сообщения, который содержит несколько элементов, элементы карусели можно скролить горизонтально.
    public struct Carousel: Codable {
        
        enum CodingKeys: CodingKey {
            case type, title, description, photoId, buttons, action
        }
        
        let type = "carousel"
        
        /// заголовок, максимум 80 символов
        let title: String?
        
        /// подзаголовок, максимум 80 символов
        let description: String?
        
        /// id изображения, которое надо прикрепить. Пропорции изображения: 13/8; Минимальный размер: 221х136;
        /// Загрузка изображений для карусели происходит также, как и загрузка изображений ботами в сообщениях.
        let photoId: String
        
        /// массив с кнопками — можно передать любые кнопки, которые описаны в разделе «Клавиатуры для ботов» → «Структура данных». Один элемент карусели может содержать не больше 3-х кнопок.
        let buttons: Button
        
        /// Объект, описывающий действие, которое необходимо выполнить при нажатии на элемент карусели.
        public enum Action: Codable {
            private struct Link: Codable {
                private enum CodingKeys: CodingKey {
                    case type, link
                }
                
                let type = "open_link"
                
                let link: String
            }
            
            private struct Photo: Codable {
                private enum CodingKeys: CodingKey {
                    case type
                }
                
                let type = "open_photo"
            }
            
            case link(String)
            case photo
            
            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                
                if let linkValue = try? container.decode(Link.self) {
                    self = .link(linkValue.link)
                } else if let _ = try? container.decode(Photo.self) {
                    self = .photo
                }
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Data doesn't match"))
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case let .link(linkValue):
                    try container.encode(Link(link: linkValue))
                case .photo:
                    try container.encode(Photo())
                }
            }
        }
        
        let action: Action?
    }
    
    case carousel(Carousel)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let carouselValue = try? container.decode(Carousel.self) {
            self = .carousel(carouselValue)
        }
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Data doesn't match"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .carousel(carouselValue):
            return try container.encode(carouselValue)
        }
    }
    
}
