require "uri"
require "net/http"
require "erb"
require "./lib/mapping"
require "./lib/json_clean"
require "byebug"

class DiscordBot::Commands::Weather
  include ERB::Util
  def initialize(event, args)
    @event = event
    @args = args
  end

  def call
    token = ENV["WEATHER"]
    local = url_encode(Mapping.get_local_name(args))
    uri = URI("https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=#{token}&limit=1&format=JSON&locationName=#{local}&elementName=")

    res = Net::HTTP.get_response(uri)

    if res.is_a?(Net::HTTPSuccess)
      clean_data = JsonClean.get_weather_params(res.body)
      url = Mapping.get_weather_icon(clean_data.state)
    
      while url.blank?
        false
      end
        embed = Discordrb::Webhooks::Embed.new
        embed.colour = 0xff8040
        embed.title = "**#{clean_data.local}**"
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: url)
        embed.add_field name: "現在狀態 :", value: clean_data.state.to_s
        embed.add_field name: "下雨機率 :", value: "#{clean_data.rain} %"
        embed.add_field name: "氣溫介於 :", value: "#{clean_data.min} ~ #{clean_data.max} 度之間"

        event.send_embed(nil, embed)
      
    else
      event.respond "派七摟！等等再試背"
    end
  end

  private

  attr_reader :event, :args
end
