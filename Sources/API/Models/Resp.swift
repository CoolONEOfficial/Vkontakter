//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 28.11.2020.
//

import Foundation
import SwiftSoup

struct RespObject {
    var name: String
    let params: [RespParameter]
}

struct RespEnum {
    let name: String
    let cases: [String: (String, String)]
    let casesType: RespParameter.ParamType
}

struct RespParameter {
    internal init(name: String, description: String?, type: RespParameter.ParamType, required: Bool) {
        self.name = name
        self.description = description
        self.type = type
        self.required = required && !(description?.contains("если") ?? false)
    }
    
    public enum ParamType: CaseIterable, Equatable {
        case Int
        case UInt
        case Int32
        case String
        case Double
        case Bool
        indirect case Array(ParamType?)
        indirect case Dict(ParamType, ParamType)
        indirect case Enum(RespEnum?)
        indirect case Typealias(String? = nil)
        indirect case ArrayByComma(ParamType?)
        case Object(RespObject?)
        case Keyboard
        case Template
        case ContentSource
        case Photo
        case Flag
        case Attachments
        case Message
        case PhotoType
        case PhotoSizes
        case EventData
        case MessagePayload
        case SavedDoc
        case UserFields
        case UserArr
        case IdOrName
        
        static let allCases: [Self] = {
            var cases = [Self]()
            cases.append(contentsOf: hardcodedCases)
            cases.append(.ArrayByComma(nil))
            cases.append(.Array(nil))
            cases.append(.Enum(nil))
            cases.append(.Typealias(nil))
            cases.append(.Object(nil))
            cases.append(contentsOf: primitiveCases)
            return cases
        }()
        
        static var arrayCases: [Self] =  [ .Object(nil) ] + primitiveCases + hardcodedCases
        
        static let primitiveCases: [Self] = [.IdOrName, .String, .Int32, .UInt, .Int, .Double, .Bool]
        
        static let hardcodedCases: [Self] = [.Keyboard, .Template, .ContentSource, .Photo, .Flag, .Dict(.String, .String), .Attachments, .Message, .PhotoSizes, .PhotoType, .EventData, .MessagePayload, .SavedDoc, .UserFields, .UserArr]
        
        static let typedCases = primitiveCases + hardcodedCases
        
        var matchWords: [String] {
            switch self {
            case .Int:
                return [ "целое число", "целых чисел", "integer", "number", "id", "идентификатор" ]
            case .UInt:
                return [ "положительное число", "положительных чисел", "unixtime", "идентификатор сообщества", "идентификатор сервера", "идентификатор добавленного сервера" ]
            case .Int32:
                return [ "int32" ]
            case .String:
                return [
                    "строк", "string",
                    "внешние сервисы", "langs", "сообщение об ошибке",
                    "список положительных чисел, разделенных запятыми",
                    "url", "src", "created"
                ]
            case .Double:
                return [ "дробное число", "дробных чисел", "float" ]
            case .Bool:
                return [ "bool" ]
            case .Dict(_, _):
                return [ "данные об указанных в профиле сервисах пользователя" ]
            case .Array:
                return [ "список", "array", "массив" ]
            case .ArrayByComma:
                return [ "через запятую" ]
            case .Object(_):
                return [ "объект", "object", "информация о высшем учебном заведении" ]
            case .Keyboard:
                return [ "клавиатуру бота", "объект клавиатуры для ботов." ]
            case .Template:
                return [ "шаблон сообщения" ]
            case .ContentSource:
                return [ "источник пользовательского контента для чат-ботов" ]
            case .Flag:
                return [ "флаг", "integer, [0,1]", "известен ли", "есть ли", "возвращает 1." ]
            case .Photo:
                return [ "объект photo" ]
            case .PhotoSizes:
                return [ "изображения в разных размерах" ]
            case .PhotoType:
                return [ "обозначение размера и пропорций копии" ]
            case .Enum:
                return [ "{case}", "возможные значения" ]
            case .Typealias:
                return [ "аналогичный объекту" ]
            case .Attachments:
                return [ "медиавложения" ]
            case .Message:
                return [ "пересланных сообщений", ", в ответ на которое отправлено" ]
            case .EventData:
                return [ "произойти после нажатия на кнопку" ]
            case .MessagePayload:
                return [ "полезная нагрузка" ]
            case .SavedDoc:
                return [ "type (string) с возможными значениями graffiti" ]
            case .UserFields:
                return [ "список дополнительных полей профилей" ]
            case .UserArr:
                return [ "массив объектов пользователей" ]
            case .IdOrName:
                return [ "идентификаторы пользователей или их короткие имена" ]
            }
        }

        var string: String? {
            switch self {
            case .Int:
                return "Int64"
            case .UInt:
                return "UInt64"
            case .Int32:
                return "Int32"
            case .String:
                return "String"
            case .Double:
                return "Double"
            case .Bool:
                return "Bool"
            case let .Dict(keyType, valType):
                guard let keyString = keyType.string, let valString = valType.string else { return nil }
                return "[\(keyString): \(valString)]"
            case let .Array(type):
                guard let type = type, let innerString = type.string else { return nil }
                return "[\(innerString)]"
            case let .ArrayByComma(type):
                guard let type = type, let innerString = type.string else { return nil }
                return "ArrayByComma<\(innerString)>"
            case let .Enum(params):
                guard let params = params else { return nil }
                return params.name
            case let .Object(params):
                guard let params = params else { return nil }
                return params.name
            case .Keyboard:
                return "Keyboard"
            case .Template:
                return "Template"
            case .ContentSource:
                return "ContentSource"
            case .Flag:
                return "VkFlag"
            case .Photo:
                return "Photo"
            case .PhotoSizes:
                return "[PhotoSize]"
            case .PhotoType:
                return "PhotoType"
            case .Typealias:
                return nil
            case .Attachments:
                return "ArrayByComma<Attachment>"
            case .Message:
                return "[Message]"
            case .EventData:
                return "EventData"
            case .MessagePayload:
                return "Message.Payload"
            case .SavedDoc:
                return "ArrayOrValue<SavedDoc>"
            case .UserFields:
                return "ArrayByComma<UserField>"
            case .UserArr:
                return "[User]"
            case .IdOrName:
                return "IdOrUsername"
            }
        }
        
        public static func == (lhs: RespParameter.ParamType, rhs: RespParameter.ParamType) -> Bool {
            lhs.matchWords == rhs.matchWords
        }
        
        var innerObject: Self {
            switch self {
            case let .Array(type):
                return type?.innerObject ?? self
            case let .ArrayByComma(type):
                return type?.innerObject ?? self
            default:
                return self
            }
        }
    }

    let name: String
    var codeName: String {
        name.camelized
    }
    let description: String?
    let type: ParamType
    var required: Bool
    
    static func checkRequired(_ str: String) -> Bool {
        debugPrint("STR: " + str, str.lowercased().contains("обязательный параметр")
                    && !str.lowercased().contains("если"))
        return str.lowercased().contains("обязательный параметр")
            && !str.lowercased().contains("если")
            //&& !str.lowercased().contains("поле возвращается, если")
    }
    
    var typeString: String {
        let str: String
        if case .Typealias = type {
            str = name.capitalizingFirstLetter()
        } else {
            str = type.string!
        }
        return str + (required ? "" : "?")
    }
    
    static func from(inlineEl: Element) throws -> [Self]? {
        guard let nameEl = try? inlineEl.select("b").first() else { return nil }
        let ownDesc = try inlineEl.select("span").first()?.ownText() ?? ""
        var fullDesc = try inlineEl.select("span").first()?.text() ?? ""
        
        
        if let subListText = try inlineEl.children().first { $0.tagName() == "span" }?.children().filter({ $0.tagName() == "ul" }).map({ try $0.text() }).reduce("", +),
           !subListText.isEmpty {
            fullDesc = String(fullDesc.dropLast(subListText.count))
        }
        
        let type = try inlineEl.select(".wk_gray").first()?.ownText() ?? ""
        
        var arr = [Self?]()
        
        let names = nameEl.ownText().components(separatedBy: ", ").filter({ !$0.contains(" ") }).map(\.camelized)
        if names.filter({ !$0.isEmpty }).isEmpty { return nil }
        for name in names {
            var desc = fullDesc.replacingOccurrences(of: ";", with: ".")
            if let ind = ["–", "—"].compactMap({ desc.firstIndex(of: $0) }).first {
                let startIndex = desc.index(ind, offsetBy: 2)
                desc = String(desc[startIndex ..< desc.endIndex]).capitalizingFirstLetter()
            }
            
            let subEl = try inlineEl.select(".listing").first() ?? inlineEl
            let resultType: ParamType = try ParamType.allCases.findType(el: subEl, name: name, type: type, desc: ownDesc, fullDesc: fullDesc)
            arr.append(.init(name: name, description: desc, type: resultType, required: checkRequired(fullDesc)))
        }
        
        return arr.compactMap { $0 }
    }
    
    static func from(typeEl: Element, required: Bool) throws -> Self? {
        let cols = try typeEl.select("td").array()
        guard !cols.isEmpty, let name = try cols[0].select("b").first()?.ownText().camelized else { return nil }
        let type = try cols[0].select(".wk_gray").first()?.ownText() ?? ""
        let contentEl = cols[1]
        
        let fullDesc: String
        if try contentEl.getElementsByClass("listing").isEmpty() {
            fullDesc = try contentEl.text().capitalizingFirstLetter()
        } else {
            fullDesc = contentEl.ownText().capitalizingFirstLetter()
        }
        let desc = fullDesc.beforeLastDotOrComma
        let listingEl = try typeEl.select(".listing").first()
        let resultType: ParamType = try ParamType.allCases.findType(el: listingEl ?? typeEl, name: name, type: type, desc: desc, fullDesc: fullDesc)
        return .init(name: name, description: desc, type: resultType, required: required)
    }
    
    static func from(el: Element) throws -> Self {
        let typeEl = try el.select(".dev_param_opts").first()!
        let type = typeEl.ownText()
        let name = try el.select(".dev_param_name").first()!.ownText().camelized
        
        let descEl = try el.select(".dev_param_desc").first()!
        let fullDesc = try descEl.text()
        
        let resultType: ParamType = try ParamType.allCases.findType(el: el, name: name, type: type, desc: fullDesc)
        
        var desc = fullDesc.capitalizingFirstLetter()
        if let dotIndex = desc.lastIndex(of: ".") {
            desc = String(desc[desc.startIndex ... dotIndex])
        } else {
            desc = descEl.ownText()
        }
        
        return .init(name: name, description: desc, type: resultType, required: checkRequired(fullDesc))
       
    }
}

extension RespParameter: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
}

extension Array where Element == RespParameter.ParamType {
    func findType(el: SwiftSoup.Element?, name: String, type: String, desc: String, fullDesc: String? = nil) throws -> RespParameter.ParamType {
        var el = el
        for _case in self {
            for matchWord in _case.matchWords where
                desc.lowercased().contains(matchWord)
                || fullDesc?.lowercased().contains(matchWord) ?? false
                || type.lowercased().contains(matchWord)
                || name.lowercased().contains(matchWord) {
                
                //debugPrint("founded \(_case) by \(matchWord) for n(\(name)) type(\(type)) desc \(desc) fullDesc \(fullDesc ?? "nil")")
                
                switch _case {
                case .Typealias:
                    for word in RespParameter.ParamType.Typealias().matchWords {
                        let desc = fullDesc ?? desc
                        if let index = desc.ranges(of: word).last?.upperBound {
                            let str = String(desc[index..<desc.endIndex])
                                .trimmingCharacters(in: [" ", ".", ";"])
                                .capitalizingFirstLetter()
                            return .Typealias(str)
                        }
                    }
                    
                    fatalError()
                case .Object:
                    if let child = el?.child(0), child.tagName() == "li",
                       let spanChild = Optional(child.child(0)), spanChild.tagName() == "span",
                       let ulChild = Optional(spanChild.child(0)), ulChild.tagName() == "ul" {
                        el = ulChild
                    }
                    
                    let params = try el?.children()
                        .filter { $0.tagName() == "li" || $0.tagName() == "b" }
                        .compactMap { inlineEl -> [RespParameter]? in
                        try RespParameter.from(inlineEl: inlineEl)
                    }.flatMap { $0 } ?? []
                    
                    return .Object(.init(name: name.capitalizingFirstLetter(), params: params))
                case .Array:
                    let arrayType = try RespParameter.ParamType.arrayCases.findType(el: el, name: name.isEmpty ? "Item" : name, type: type, desc: desc, fullDesc: fullDesc)
                    
                    return .Array(arrayType)
                case .ArrayByComma:
                    let arrayType = try RespParameter.ParamType.arrayCases.findType(el: el, name: name.isEmpty ? "Item" : name, type: type, desc: desc, fullDesc: fullDesc)
                    
                    return .ArrayByComma(arrayType)
                case .Enum:
                    let primitiveType = try RespParameter.ParamType.primitiveCases.findType(el: el, name: name, type: type, desc: desc, fullDesc: fullDesc)

                    var cases = try el?.children()
                        .filter { $0.tagName() == "li" }
                        .map { try $0.text().firstSentence ?? $0.text() } ?? []

                    if cases.isEmpty, let el = el {
                        cases = try el.select("i")
                            .map { try $0.text().trimmingCharacters(in: ["\""]) }
                            .joined(separator: ", ")
                            .components(separatedBy: ", ")
                            .unique
                    }
                    
                    if cases.isEmpty {
                        fatalError("Unable to parse enum cases")
                    }
                    
                    return .Enum(.init(
                        name: name.capitalizingFirstLetter().replacingOccurrences(of: "Case", with: ""),
                        cases: cases.reduce([:]) { dict, next in
                            var dict = dict
                            let comps = next.components(separatedBy: "—")
                                .map { $0.trimmingCharacters(in: [" ", ";", "."]) }
                            if comps.count == 1 && Int(comps[0]) != nil {
                                dict[comps[0]] = (comps[0], next)
                            } else {
                                let key = comps.count == 1 ? comps[0] : comps[1]
                                dict[key.transliterate] = (comps[0], next)
                            }
                            return dict
                        },
                        casesType: primitiveType
                    ))
                default:
                    return _case
                }
            }
        }
        
        fatalError("Type doesn't handled")
    }
}
