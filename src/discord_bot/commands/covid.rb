require "./lib/crawler"

class DiscordBot::Commands::Covid
  def initialize(event)
    @event = event
  end

  def call
    embed = Crawler.covid
    event.send_embed(nil, embed)
  end

  private

  attr_reader :event
end