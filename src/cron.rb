require 'rufus-scheduler'
require "./lib/factory_bot"

# todo 指令可下暫停和重新開始 job
module Cron
  @bot = FactoryBot.bot
  @scheduler = Rufus::Scheduler.singleton
  
  @scheduler.cron '30 14 * * *' do
    Handlers::CovidHandler.call(@bot)
  end

  @scheduler.every '10s' do
    @bot.send_message("959097200183496705", "cron job test")
  end

  def self.run
    @bot.run
  end
end