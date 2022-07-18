module FactoryBot
  def self.bot
    bot = Discordrb::Commands::CommandBot.new(
      token: ENV["TOKEN"],
      client_id: ENV["CLIENT_ID"],
      prefix: "!",
    )
    bot
  end

  def self.sign_bot
    args = %w[--headless --no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222]
    brower = Watir::Browser.new :chrome, options: {args: args}
    brower
  end
end