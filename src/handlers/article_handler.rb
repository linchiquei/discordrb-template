

class Handlers::ArticleHandler

  def self.call(bot, count)
    if count <= 417
      count += 1
      bot.send_message(ENV["ART_CHANNEL"], "http://railscasts.com/episodes/#{count}-foundation")
    end
  end
end