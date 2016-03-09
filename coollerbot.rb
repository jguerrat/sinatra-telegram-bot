require 'telegram/bot'

token = '203193636:AAHwM91TwltfLXnCJF5fGcwhbWHnrstF-YU'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'

      question = "Hola, #{message.from.username} \n Canberra es capital de ...??"
      # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
      answers =
      Telegram::Bot::Types::ReplyKeyboardMarkup
      .new(keyboard: [%w(NORUEGA FINLANDIA), %w(SUIZA AUSTRALIA)], one_time_keyboard: true)
      bot.api.sendMessage(chat_id: message.chat.id, text: question, reply_markup: answers)
    when '/stop'
      # See more: https://core.telegram.org/bots/api#replykeyboardhide
      kb = Telegram::Bot::Types::ReplyKeyboardHide.new(hide_keyboard: true)
      bot.api.sendMessage(chat_id: message.chat.id, text: "Sorry to see you go :( \n Good Bye, #{message.from.username}!", reply_markup: kb)
    end
  end
end