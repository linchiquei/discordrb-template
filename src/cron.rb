require 'rufus-scheduler'
require "./lib/factory_bot"

# todo 指令可下暫停和重新開始 job
module Cron
  @bot = FactoryBot.bot
  @scheduler = Rufus::Scheduler.new
  
  @scheduler.cron '30 14 * * *' do
    Handlers::CovidHandler.call(@bot)
  end

  # @scheduler.cron '30 0 * * *' do
  #   Handlers::WahahaHandler.new(@bot).run
  # end

  # 正式站測試機器人頻道
  @scheduler.every '20s' do
    #Handlers::WahahaHandler.run(@bot)
    #@bot.send_message("961525720444727336", "cron job test")
  end

  def self.run
    @bot.run
  end
end