module FactoryBot
  def self.bot
    bot = Discordrb::Commands::CommandBot.new(
      token: ENV["TOKEN"],
      client_id: ENV["CLIENT_ID"],
      prefix: "!",
    )
    bot
  end
end