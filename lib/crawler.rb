require 'nokogiri'
require 'open-uri'

module Crawler
  def self.covid
    doc = Nokogiri::HTML(URI.open('https://covid-19.nchc.org.tw/dt_005-covidTable_taiwan.php'))

    while doc.nil?
      false
    end

    hash_key = ["total","today","dead","vaccine", "loc_total","loc_today","add_dead","dead_percentage","add_vaccine","vaccine_percentage"]
    data = []
    doc.css('h1', 'span small').each do |item|
      data << [hash_key.shift,item.content]
    end
    data = data.to_h
    embed = Discordrb::Webhooks::Embed.new
    embed.colour = 0xff8040
    embed.title = "**Covid-19 最新情況**"
    embed.url = "https://covid-19.nchc.org.tw/dt_005-covidTable_taiwan.php"
    embed.add_field name: "本土（新增/累積）", value: "#{data["loc_today"].gsub("本土病例","")}/#{data["loc_total"].gsub("本土病例","")}"
    embed.add_field name: "死亡（新增/累積）", value: "#{data["add_dead"]}/#{data["dead"]}"

    embed
  end
end