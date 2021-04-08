import Foundation
import Vkontakter

///Getting token from enviroment variable (most safe, recommended)
guard let token = Enviroment.get("VK_BOT_TOKEN") else {
    print("VK_BOT_TOKEN variable wasn't found in enviroment variables")
    exit(1)
}

/// Initializind Bot settings (token, debugmode)
var settings = Bot.Settings(token: token)

///Webhooks settings, enter
settings.webhooksConfig = Webhooks.Config(
    ip: "0.0.0.0",
    port: 80,
    url: openUrl, //Enviroment.get("VK_BOT_WEBHOOK_URL")!,
    groupId: UInt64(Enviroment.get("VK_GROUP_ID")!)!
)

let bot = try! Bot(settings: settings)

/// Dictionary for user echo modes
var userEchoModes: [Int64: Bool] = [:]

///Callback for Command handler, which send Echo mode status for user
func echoModeSwitch(_ update: Update, _ context: BotContext?) throws {
    guard case let .message(message) = update.object,
        let userId = message.fromId else { return }

    var onText = ""
    if let on = userEchoModes[userId] {
        onText = on ? "OFF" : "ON"
        userEchoModes[userId] = !on
    } else {
        onText = "ON"
        userEchoModes[userId] = true
    }

    let params = Bot.SendMessageParams(
        userId: userId,
        message: "Echo mode turned \(onText)"
    )
    try bot.sendMessage(params: params)
}

///Callback for Message with text handler, which send echo message to user
func echoResponse(_ update: Update, _ context: BotContext?) throws {
    guard case let .message(message) = update.object,
          let text = message.text,
          let userId = message.fromId,
          let on = userEchoModes[userId],
        on == true else { return }
    let params = Bot.SendMessageParams(userId: userId, message: text)
    try bot.sendMessage(params: params)
}

do {
    ///Dispatcher - handle all incoming messages
    let dispatcher = Dispatcher(bot: bot)

    ///Creating and adding handler for command /echo
    let commandHandler = CommandHandler(commands: ["/echo"], callback: echoModeSwitch)
    dispatcher.add(handler: commandHandler)

    ///Creating and adding handler for ordinary text messages
    let echoHandler = MessageHandler(filters: Filters.text, callback: echoResponse)
    dispatcher.add(handler: echoHandler)

    ///Longpolling updates
    _ = try Updater(bot: bot, dispatcher: dispatcher).startWebhooks(serverName: "test")

} catch {
    print(error.localizedDescription)
}
