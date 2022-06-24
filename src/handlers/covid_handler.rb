require "./lib/crawler"

class Handlers::CovidHandler
  def self.call(bot)
    embed = Crawler.covid
    bot.send_message(ENV["CHANNEL"], nil, false, embed)
  end
end


