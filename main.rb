require 'telegram/bot'

TOKEN = '1363424466:AAHbIOp83WhmUWUcGdAkrp5uPuQK3qE3X2g'


Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message| 
    bot.api.send_message(chat_id: message.chat.id, text: "Здравствуй, #{message.from.first_name}") 
  end
end
