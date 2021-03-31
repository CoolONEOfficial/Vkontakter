<p align="center"><img src="logo.png" alt="Vkontakter logo"></p>

# Vkontakter
VK Bot Framework written in Swift 5.3 with SwiftNIO network framework (forked from Telegrammer)

#[![Build](https://circleci.com/gh/givip/Telegrammer/tree/master.svg?style=shield&circle-token=04a84114573c1c6b3039ef82b88e54f1f6b8c512)](https://circleci.com/gh/givip/Telegrammer)
#[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/givip/Telegrammer/releases)
[![Language](https://img.shields.io/badge/language-Swift%205.1-orange.svg)](https://swift.org/download/)
[![Platform](https://img.shields.io/badge/platform-Linux%20/%20macOS-ffc713.svg)](https://swift.org/download/)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/CoolONEOfficial/Vkontakter/blob/master/LICENSE)


What does it do
---------------

Vkontakter is open-source framework for VK Bots developers.
It was built on top of [Apple/SwiftNIO](https://github.com/apple/swift-nio)

The simplest code of Echo Bot looks like this:

-------------
_main.swift_
```swift
import Foundation
import Vkontakter

do {
    let bot = try Bot(token: "BOT_TOKEN_HERE")

    let echoHandler = MessageHandler { (update, _) in
        _ = try? update.message?.reply(text: "Hello \(update.message?.from?.firstName ?? "anonymous")", from: bot)
    }

    let dispatcher = Dispatcher(bot: bot)
    dispatcher.add(handler: echoHandler)

    _ = try Updater(bot: bot, dispatcher: dispatcher).startLongpolling().wait()
} catch {
    exit(1)
}
```

Documentation
---------------

- Read [An official documentation for developers](https://vk.com/dev/bots)

#Usage without Vapor
#---------------

#- Use the template repository as a example [https://github.com/givip/telegrammer-bot-template.git](https://github.com/givip/telegrammer-bot-template.git)
#- Current repository contains five examples of bot implementation:
#https://github.com/givip/Telegrammer/tree/master/Sources/DemoEchoBot
#https://github.com/givip/Telegrammer/tree/master/Sources/DemoHelloBot
#https://github.com/givip/Telegrammer/tree/master/Sources/DemoSchedulerBot
#https://github.com/givip/Telegrammer/tree/master/Sources/DemoSpellCheckerBot
#https://github.com/givip/Telegrammer/tree/master/Sources/DemoWebhooksLocally

Usage with Vapor
---------------

#Use that template if you want to work with database, handle custom requests and so on.

- Use the  [https://github.com/CoolONEOfficial/vkontakter-bot-vapor-template.git](https://github.com/CoolONEOfficial/vkontakter-bot-vapor-template.git)

Requirements
---------------

- Ubuntu 16.04 or later with [Swift 5.1 or later](https://swift.org/getting-started/) / macOS with [Xcode 11 or later](https://swift.org/download/)
- Vk account and a Vk App for mobile platform or online (desktop client does not support some chatbot features)
- [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md) for dependencies 
- [Vapor 4](https://vapor.codes) (optionally, for bots with database and other server side stuff)

Contributing
---------------

See [CONTRIBUTING.md](CONTRIBUTING.md) file.

Author
---------------

Givi Pataridze
Nikolai Trukhin

[pataridzegivi@gmail.com](mailto:pataridzegivi@gmail.com)
[@givip](tg://user?id=53581534)

[coolone.official@gmail.com](mailto:coolone.official@gmail.com)
[@cooloneofficial](tg://user?id=356008384)
