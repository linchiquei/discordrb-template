class DiscordBot::Commands::Time
  def initialize(event)
    @event = event
  end

  def call
    # getlocal('+08:00')
    event.respond "現在時間 #{Time.now.strftime('%I:%M %p')}"
  end

  private

  attr_reader :event
end
