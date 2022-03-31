class DiscordBot::Commands::Time
  def initialize(event)
    @event = event
  end

  def call
    event.respond "現在時間 #{Time.now.getlocal('+08:00').strftime('%I:%M %p')}"
  end

  private

  attr_reader :event
end
