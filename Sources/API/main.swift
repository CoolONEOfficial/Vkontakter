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
    
    init(_ apiName: String, _ codeName: String? = nil) {
        self.apiName = apiName
        self.codeName = codeName ?? apiName
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
        "messages": [ .init("send", "sendMessage") ],
        "groups": [
            .init("setCallbackSettings"),
            .init("deleteCallbackServer"),
            .init("addCallbackServer"),
            .init("getCallbackServers"),
            .init("getCallbackConfirmationCode")
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
            let additionalDesc = try resultEl.text()
            desc += "\n ".i(1) + (additionalDesc.firstSentence ?? additionalDesc)
            let respParams = try resultEl.select("li").compactMap { inlineEl -> RespParameter? in
                try .from(inlineEl: inlineEl)
            }
            
            debugPrint("--- Write file ---")
            
            let filename = "Bot+\(method.codeName).swift"
            
            let fileURL = vkDir
                .appendingPathComponent("Methods")
                .appendingPathComponent(filename)
            
            let swiftFile = MethodExtensionFile(description: desc, params: params, methodGroup: methodGroup, method: method, respParams: respParams)
            
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

    let typeUrls = try html.select("tr").compactMap { rowEl in
        try rowEl.select("a").first()?.attr("href")
    }.map { URL(string: baseUrl + $0)! }
    
    for url in typeUrls {
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
            if blockTitle.contains("api до") {
                continue
            } else if blockTitle.contains("базовые") {
                params.append(contentsOf: try getParams(true))
            } else if blockTitle.contains("опциональные") || singleBlock || blockTitle.contains("api с") {
                params.append(contentsOf: try getParams(false))
            }
        }
        
        if params.isEmpty {
            debugPrint("--- Skipping file ---")
        } else {
            debugPrint("--- Write file ---")
            
            let name = url.absoluteString.components(separatedBy: "/").last!
            let filename = "\(name.camelized.capitalizingFirstLetter()).swift"
            
            let fileURL = vkDir
                .appendingPathComponent("Models")
                .appendingPathComponent("Objects")
                .appendingPathComponent(filename)
            
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

