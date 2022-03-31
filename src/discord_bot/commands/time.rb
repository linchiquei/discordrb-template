class DiscordBot::Commands::Time
  def initialize(event)
    @event = event
  end

  def call
    event.respond "現在時間 #{Time.zone.strftime('%H:%M:%S')}"
  end

  private

  attr_reader :event
end
