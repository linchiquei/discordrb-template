class DiscordBot::Commands::Help
  CROSS_MARK = "❤️"
  def initialize(event)
    @event = event
  end

  def call
    embed = Discordrb::Webhooks::Embed.new
    embed.colour = 0xff8040
    embed.title = "**使用指令**"
    embed.add_field name: "!time", value: "取得現在時間"
    embed.add_field name: "!guess", value: "觸發開始玩終極密碼"
    embed.add_field name: "!weather 台北", value: "取得當下台北天氣，或輸入其他縣市，取得其他縣市天氣"
    event.send_embed(nil, embed)
  end

  private

  attr_reader :event
end