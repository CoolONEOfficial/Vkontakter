

<p align="center"><img width=200 src="logo.png" alt="Vkontakter logo"></p>

# Vkontakter
VK Bot Framework written in Swift 5.3 with SwiftNIO network framework

[![Build Status](https://travis-ci.com/CoolONEOfficial/Vkontakter.svg?branch=master)](https://travis-ci.com/CoolONEOfficial/Vkontakter)[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](https://github.com/givip/Telegrammer/releases)[![Language](https://img.shields.io/badge/language-Swift%205.1-orange.svg)](https://swift.org/download/)[![Platform](https://img.shields.io/badge/platform-Linux%20/%20macOS-ffc713.svg)](https://swift.org/download/)[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/CoolONEOfficial/Vkontakter/blob/master/LICENSE)


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

settings.webhooksConfig = Webhooks.Config(
    ip: Enviroment.get("VK_BOT_IP")!,
    url: Enviroment.get("VK_BOT_WEBHOOK_URL")!,
    groupId: UInt64(Enviroment.get("VK_GROUP_ID")!)!
)

let bot = try Bot(token: "BOT_TOKEN_HERE")

let echoHandler = MessageHandler { (update, _) in
    guard let message = update.message, let text = message.text else {
      return
    }
		let params = Bot.SendMessageParams(userId: userId, message: "Hello User \(update.message.fromId)")
    try bot.sendMessage(params: params)
}

let dispatcher = Dispatcher(bot: bot)
dispatcher.add(handler: echoHandler)

_ = try Updater(bot: bot, dispatcher: dispatcher).startWebhooks(serverName: "testserver")

```

Documentation
---------------

- Read [An official documentation for developers](https://vk.com/dev/bots)

Usage with Vapor
---------------

- Use the  [https://github.com/CoolONEOfficial/vkontakter-bot-vapor-template.git](https://github.com/CoolONEOfficial/vkontakter-bot-vapor-template.git)

Requirements
---------------

- Ubuntu 16.04 or later with [Swift 5.1 or later](https://swift.org/getting-started/) / macOS with [Xcode 11 or later](https://swift.org/download/)
- Vk account and a Vk App for mobile platform or online (desktop client does not support some chatbot features)
- [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md) for dependencies 
- [Vapor 4](https://vapor.codes)

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
