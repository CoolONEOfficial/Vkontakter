import SwiftSoup
import Foundation

let baseUrl = "https://vk.com"

let parseMethods = false
let parseTypes = true

func loadHtml(_ url: URL) -> String? {
    for _ in 0..<10 {
        do {
            return try String(contentsOf: url)
        } catch {
            sleep(1)
            continue
        }
    }
    
    return nil
}

struct Method {
    let apiName: String
    let codeName: String
    let resultWrapped: Bool
    
    init(_ apiName: String, _ codeName: String? = nil, resultWrapped: Bool = true) {
        self.apiName = apiName
        self.codeName = codeName ?? apiName
        self.resultWrapped = resultWrapped
    }
}

let projectDir = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()

let vkDir = projectDir
    .appendingPathComponent("Sources")
    .appendingPathComponent("Vkontakter")
    .appendingPathComponent("Bot")
    .appendingPathComponent("Vk")

if parseMethods {

    let methodGroups: [ String: [ Method ] ] = [
        "messages": [
            .init("send", "sendMessage"),
            .init("sendMessageEventAnswer"),
            .init("edit", "editMessage")
        ],
        "groups": [
            .init("setCallbackSettings"),
            .init("deleteCallbackServer"),
            .init("addCallbackServer"),
            .init("getCallbackServers"),
            .init("getCallbackConfirmationCode")
        ],
        "photos": [
            .init("getMessagesUploadServer", "getMessagePhotosUploadServer"),
            .init("saveMessagesPhoto")
        ],
        "docs": [
            .init("save", "saveDoc"),
            .init("getMessagesUploadServer", "getMessageDocsUploadServer", resultWrapped: false)
        ],
        "users": [
            .init("get", "getUser")
        ]
    ]

    for (methodGroup, methods) in methodGroups {
        for method in methods {
            
            let url = URL(string: "\(baseUrl)/dev/\(methodGroup).\(method.apiName)")!
            debugPrint("---   Url \(url.absoluteURL)   ---")
            debugPrint("--- Parse html ---")
            
            let htmlStr = loadHtml(url)
            
            let html = try SwiftSoup.parse(htmlStr!)

            var desc = try html.select(".dev_method_desc").first()!.text()

            let params = try html.select(".dev_params_table").first()!
                .select(".dev_param_row").map { rowElement -> RespParameter in
                    try .from(el: rowElement)
                }
            
            let resultEl = try html.select(".dev_method_result").first()!
            let resultElText = try resultEl.text()
            desc += "\n ".i(1) + (resultElText.firstSentence ?? resultElText)
            
            var respParams: [RespParameter]? = nil
            var respType: RespParameter!
            if let inlineEls = try? resultEl.select("li"), !inlineEls.isEmpty() {
                let params = try inlineEls.compactMap { inlineEl -> [RespParameter]? in
                    try RespParameter.from(inlineEl: inlineEl)
                }.flatMap { $0 }
                respParams = [ .init(
                    name: "items",
                    description: nil,
                    type: .Array(.Object(.init(name: "Item", params: params))),
                    required: true
                ) ]
            } else if resultElText.contains("После успешного выполнения возвращает 1.") {
                respType = .init(name: "VkFlag", description: nil, type: .Flag, required: true)
            } else if resultElText.contains("После успешного выполнения возвращает массив объектов, описывающих загруженные документы.") {
                respType = .init(name: "Type", description: nil, type: .SavedDoc, required: true)
            } else {
                let name: String
                debugPrint("resultEl.text() \( try resultEl.text() )")
                if let entryName = resultElText.afterLastText("в поле ")  {
                    name = String(entryName[entryName.startIndex ..< entryName.firstIndex(of: " ")!]).camelized
                } else {
                    let apiName = method.apiName
                    name = apiName[(apiName.lastIndex { $0.isUppercase } ?? apiName.startIndex) ..< apiName.endIndex].lowercased()
                }
                
                let type = try RespParameter.ParamType.allCases.findType(el: resultEl, name: name, type: "", desc: try resultEl.text())

                if let paramsText = resultElText.afterLastText(" возвращает объект с полями")?.split(separator: ",")
                    .reduce(into: [Substring](), { arr, str in
                        if let last = arr.last, last.contains("("), !last.contains(")") {
                            arr[arr.count - 1] += str
                        } else {
                            arr.append(str)
                        }
                    }) {
                    respParams = try paramsText.map { text in
                        let name = text.components(separatedBy: " ").filter { !$0.isEmpty }.first!.camelized
                        
                        let type = try RespParameter.ParamType.allCases.findType(el: nil, name: "", type: "", desc: String(text))
                        return .init(name: name, description: nil, type: type, required: true)
                    }
                } else if method.resultWrapped {
                    respParams = [ .init(name: name, description: nil, type: type, required: true) ]
                } else {
                    guard case let .Object(inner) = type, let innerParams = inner?.params else { fatalError() }
                    respParams = innerParams
                }
            }
            
            if resultElText.contains("После успешного выполнения возвращает массив"),
               let firstParam = respParams?.first {
                respType = firstParam
            } else if let respParams = respParams {
                let name = method.codeCapitalized.capitalizingFirstLetter() + "Resp"
                respType = .init(
                    name: name,
                    description: nil,
                    type: .Object(.init(name: name, params: respParams)),
                    required: true
                )
            }
            
            debugPrint("--- Write file ---")
            
            let filename = "Bot+\(method.codeName).swift"
            
            let fileURL = vkDir
                .appendingPathComponent("Methods")
                .appendingPathComponent(filename)
            
            let swiftFile = MethodExtensionFile(description: desc, params: params, methodGroup: methodGroup, method: method, resp: respType)
            
            do {
                try swiftFile.wrappedString.write(to: fileURL, atomically: false, encoding: .utf8)
            } catch {
                debugPrint("error \(error)")
            }

        }
    }
}

extension Element {
    func headerText() throws -> String {
        try select(".wk_header").text()
    }
}

if parseTypes {

    let url = URL(string: "\(baseUrl)/dev/objects")!
    let htmlStr = loadHtml(url)
    let html = try SwiftSoup.parse(htmlStr!)

    var typeUrls = try html.select("tr").compactMap { rowEl in
        try rowEl.select("a").first()?.attr("href")
    }

    typeUrls.append("/dev/objects/graffiti")
    
    for url in typeUrls.compactMap({ URL(string: baseUrl + $0) }) {
        debugPrint("---   Url \(url.absoluteURL)   ---")
        debugPrint("--- Parse html ---")
        
        let htmlStr = loadHtml(url)
        let html = try SwiftSoup.parse(htmlStr!)
        
        var params = [RespParameter]()
        
        var blockEls = try html.select(".dev_page_block").array()
        
        if let el = try blockEls.last?.getElementsMatchingOwnText("Продолжение").first() {
            let addUrl = URL(string: baseUrl + (try el.attr("href")))!
            let addHtmlStr = loadHtml(addUrl)
            let addHtml = try SwiftSoup.parse(addHtmlStr!)
            blockEls.append(contentsOf: try addHtml.select(".dev_page_block"))
        }
        
        let singleBlock = try blockEls.filter {
            try !$0.headerText().lowercased().contains("api до")
        }.count == 1

        for blockEl in blockEls {
            guard let tableEl = try blockEl.select(".wk_table").first() else { continue }
            
            let getParams: ((_ required: Bool) throws -> [RespParameter]) = { required in
                try tableEl.select("tr").compactMap { paramEl -> RespParameter? in
                    try .from(typeEl: paramEl, required: required)
                }
            }

            let blockTitle = try blockEl.headerText().lowercased()
            if blockTitle.contains("api до") || blockTitle.contains("api ниже") {
                continue
            } else if blockTitle.contains("базовые") {
                params.append(contentsOf: try getParams(true))
            } else if blockTitle.contains("опциональные") || singleBlock || blockTitle.contains("api с") || blockTitle.contains("список объектов ›") {
                params.append(contentsOf: try getParams(false))
            }
        }
        
        if params.map(\.codeName).contains("ownerId") {
            params.append(.init(name: "accessKey", description: "При получении объектов, прямого доступа к которым может не быть, например, фотографий или видео в новостях, вместе с объектами приходит поле access_key, которое необходимо передавать при получении этих объектов напрямую или при совершении с ними действий. ", type: .String, required: false))
        }
        
        params = params.unique
        
        if params.isEmpty {
            debugPrint("--- Skipping file ---")
        } else {
            debugPrint("--- Write file ---")
            
            let name = url.absoluteString.components(separatedBy: "/").last!
            let filename = "\(name.camelized.capitalizingFirstLetter()).swift"
            
            let fileURL = vkDir
                .appendingPathComponent("Models")
                .appendingPathComponent(filename)
            
            debugPrint("Writing file \(fileURL.relativePath)")
            
            let desc = singleBlock ? blockEls.first!.ownText().beforeLastDotOrComma : try blockEls.first!.text()
            
            let swiftFile = TypeFile(description: desc, params: params, apiName: name)
            
            do {
                try swiftFile.wrappedString.write(to: fileURL, atomically: false, encoding: .utf8)
            } catch {
                debugPrint("error \(error)")
            }
        }
    }

}
