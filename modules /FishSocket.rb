require 'telegram/bot'
require './library/mac-shake'
require './library/database'
require './modules/listener'
require './modules/security'
require './modules/standart_messages'
require './modules/response'
Entry point class
class FishSocket
  include Database
  def initialize
    super
    # Initialize BD
    Database.setup
    # Establishing webhook via @gem telegram/bot, using API-KEY
    Telegram::Bot::Client.run(TelegramOrientedInfo::APIKEY) do |bot|
      # Start time variable, for exclude message what was sends before bot starts
      startbottime = Time.now.toi
      # Active socket listener
      bot.listen do |message|
        # Processing the new income message    #if that message sent after bot run.
        Listener.catchnewmessage(message,bot) if Listener::Security.messageisnew(startbottime,message)
      end
    end
  end
end
Bot start
FishSocket.new