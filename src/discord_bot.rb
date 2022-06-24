require "./lib/factory_bot"

module DiscordBot
  throw "Lacking required secrets!" unless ENV["TOKEN"] && ENV["CLIENT_ID"]

  @bot = FactoryBot.bot

  puts "This bot's invite URL is #{@bot.invite_url}"
  puts "Click on it to invite it to your server"

  @bot.command :time do |event|
    DiscordBot::Commands::Time.new(event).call
  end

  @bot.command :guess do |event|
    DiscordBot::Commands::Guess.new(event).call
  end

  @bot.command(:weather, max_args: 1) do |event, local|
    DiscordBot::Commands::Weather.new(event, local).call
  end

  @bot.command :help do |event|
    DiscordBot::Commands::Help.new(event).call
  end

  @bot.command :covid do |event|
    DiscordBot::Commands::Covid.new(event).call
  end

  def self.run
    @bot.run
  end

  def self.invite_url
    @bot.invite_url
  end
end
