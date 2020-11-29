//
//  File.swift
//  
//
//  Created by Nickolay Truhin on 28.11.2020.
//

import Foundation
import SwiftSoup

struct RespObject {
    let name: String
    let params: [RespParameter]
}

struct RespEnum {
    let name: String
    let cases: [String: Any]
    let casesType: RespParameter.ParamType
}

struct RespParameter {
    public enum ParamType: CaseIterable, Equatable {
        case Int
        case UInt
        case String
        case Double
        case Bool
        indirect case Array(ParamType)
        indirect case Dict(ParamType, ParamType)
        indirect case Enum(RespEnum?)
        case Object(RespObject?)
        case Keyboard
        case Template
        case ContentSource
        case Photo
        case Flag
        
        static let allCases: [Self] = {
            var cases = [Self]()
            cases.append(contentsOf: hardcodedCases)
            cases.append(.Enum(nil))
            cases.append(contentsOf: primitiveCases.map { Self.Array($0) })
            cases.append(.Dict(.String, .String))
            
            cases.append(.Object(nil))
            cases.append(contentsOf: primitiveCases)
            return cases
        }()
        
        static let primitiveCases: [Self] = [.Int, .Double, .UInt, .String, .Bool]
        
        static let hardcodedCases: [Self] = [.Keyboard, .Template, .ContentSource, .Photo, .Flag]
        
        var matchWords: [String] {
            switch self {
            case .Int:
                return [ "целое число", "integer", "number" ]
            case .UInt:
                return [ "положительное число" ]
            case .String:
                return [ "строка", "полезная нагрузка", "string", "внешние сервисы" ]
            case .Double:
                return [ "дробное число" ]
            case .Bool:
                return [ "boolean" ]
            case .Dict(_, _):
                return [ "данные об указанных в профиле сервисах пользователя" ]
            case let .Array(type):
                var words = [Swift.String]()
                var word = "список "
                switch type {
                case .Int:
                    word += "целых чисел"
                case .UInt:
                    word += "положительных чисел"
                case .String:
                    words.append("langs")
                    word += "строк"
                case .Double:
                    word += "дробных чисел"
                default: break
                }
                return words
            case .Object(_):
                return [ "json-объект", "object", "информация о высшем учебном заведении" ]
            case .Keyboard:
                return [ "клавиатуру бота" ]
            case .Template:
                return [ "шаблон сообщения" ]
            case .ContentSource:
                return [ "источник пользовательского контента для чат-ботов" ]
            case .Flag:
                return [ "флаг", "0 —", "integer, [0,1]", "известен ли", "есть ли" ]
            case .Photo:
                return [ "объект photo" ]
            case .Enum:
                return [ "{case}", "возможные значения" ]
            }
        }

        var string: String {
            switch self {
            case .Int:
                return "Int64"
            case .UInt:
                return "UInt64"
            case .String:
                return "String"
            case .Double:
                return "Double"
            case .Bool:
                return "Bool"
            case let .Dict(keyType, valType):
                return "[\(keyType.string): \(valType.string)]"
            case let .Array(type):
                return "[\(type.string)]"
            case let .Enum(params):
                return params!.name
            case let .Object(params):
                return params!.name
            case .Keyboard:
                return "VkKeyboard"
            case .Template:
                return "VkTemplate"
            case .ContentSource:
                return "VkContentSource"
            case .Flag:
                return "VkFlag"
            case .Photo:
                return "VkPhoto"
            }

            fatalError("Cannot get string to type")
        }
        
        public static func == (lhs: RespParameter.ParamType, rhs: RespParameter.ParamType) -> Bool {
            lhs.string == rhs.string
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
        str.lowercased().contains("обязательный параметр")
    }
    
    var typeString: String {
        type.string + (required ? "" : "?")
    }
    
    static func from(inlineEl: Element) throws -> Self? {
        guard let nameEl = try inlineEl.select("b").first() else { return nil }
        let name = nameEl.ownText().camelized
        let fullDesc = try inlineEl.select("span").first()!.text()
        let type = try inlineEl.select(".wk_gray").first()?.ownText() ?? ""
        
        var desc = fullDesc.replacingOccurrences(of: ";", with: ".")
        let startIndex = desc.index(desc.firstIndex(of: "—")!, offsetBy: 2)
        desc = String(desc[startIndex ..< desc.endIndex]).capitalizingFirstLetter()
        
        let subEl = try inlineEl.select(".listing").first()
        let resultType: ParamType = try ParamType.allCases.findType(el: subEl, name: name, type: type, desc: fullDesc)
        return .init(name: name, description: desc, type: resultType, required: checkRequired(fullDesc))
    }
    
    static func from(typeEl: Element, required: Bool) throws -> Self? {
        let cols = try typeEl.select("td").array()
        guard let name = try cols[0].select("b").first()?.ownText().camelized else { return nil }
        let type = try cols[0].select(".wk_gray").first()?.ownText() ?? ""
        let fullDesc = cols[1].ownText().capitalizingFirstLetter()
        let desc = fullDesc.beforeLastDot ?? ""
        let listingEl = try typeEl.select(".listing").first()
        let resultType: ParamType = try ParamType.allCases.findType(el: listingEl ?? typeEl, name: name, type: type, desc: fullDesc)

        return .init(name: name, description: desc, type: resultType, required: required)
    }
    
    static func from(el: Element) throws -> Self {
        let typeEl = try el.select(".dev_param_opts").first()!
        let type = typeEl.ownText()
        let name = try el.select(".dev_param_name").first()!.ownText().camelized
        
        let descEl = try el.select(".dev_param_desc").first()!
        let fullDesc = try descEl.text()
        
        debugPrint("full \(fullDesc)")
        debugPrint("own \(descEl.ownText())")
        
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

extension Array where Element == RespParameter.ParamType {
    func findType(el: SwiftSoup.Element?, name: String, type: String, desc: String) throws -> RespParameter.ParamType {
        for _case in self {
            for matchWord in _case.matchWords where
                desc.lowercased().contains(matchWord)
                || type.lowercased().contains(matchWord) {
                
                debugPrint("founded \(_case) for n(\(name)) type(\(type)) desc \(desc)")
                
                switch _case {
                case .Object:
                    let params = try el?.children()
                        .filter { $0.tagName() == "li" }
                        .compactMap { inlineEl -> RespParameter? in
                        try .from(inlineEl: inlineEl)
                    } ?? []
                    
                    return .Object(.init(name: name.capitalizingFirstLetter(), params: params))
                case .Enum:
                    let primitiveType = try RespParameter.ParamType.primitiveCases.findType(el: el, name: name, type: type, desc: desc)

                    let cases = try el?.children()
                        .filter { $0.tagName() == "li" }
                        .map { try $0.text() } ?? []
                    
                    return .Enum(.init(
                        name: name.capitalizingFirstLetter().replacingOccurrences(of: "Case", with: ""),
                        cases: cases.reduce([:]) { dict, next in
                            var dict = dict
                            let comps = next.components(separatedBy: "—")
                                .map { $0.trimmingCharacters(in: [" ", ";"]) }
                            dict[comps[1].transliterate] = comps[0]
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
