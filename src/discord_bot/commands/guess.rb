class DiscordBot::Commands::Guess
  def initialize(event)
    @event = event
  end

  def call
    magic = rand(1..10)
    event.respond "你啟動了，終極密碼。範圍：1-10"
    event.user.await!(timeout: 300) do |guess_event|
      guess = guess_event.message.content.to_i
      case guess
      when 0
        guess_event.respond "不要鬧我只猜數字"
        false
      when magic
        guess_event.respond "嘿嘿嘿你贏了"
        true
      else
        guess_event.respond(guess > magic ? "太大摟" : "太小摟")
        false
      end
    end
    event.respond "密碼：`#{magic}`"
  end

  private

  attr_reader :event
end
