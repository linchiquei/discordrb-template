

class Handlers::ArticleHandler
  @current_article = 418
  def self.call(bot)
    @current_article -= 1
    bot.send_message(ENV["ART_CHANNEL"], "http://railscasts.com/episodes/#{@current_article}-foundation")
  end
end