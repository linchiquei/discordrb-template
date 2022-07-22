require "./lib/shopee"

class Handlers::ShopeeHandler
  def self.run(bot, shopee)
    @bot = bot
    @b = shopee.brower

    @b.goto("https://shopee.tw/shopee-coins/")
    @b.button(class: "pcmall-dailycheckin_3uUmyu").click
    notify_discord("點擊簽錢")

    @b.text_field(placeholder: "電話號碼/使用者名稱/Email").set ENV['WA']
    notify_discord("輸入名字")

    @b.text_field(placeholder: "密碼").set ENV['HAHA']
    notify_discord("輸入密碼")

    @b.button(class: "wyhvVD _1EApiB hq6WM5 L-VL8Q cepDQ1 _7w24N1").click
    notify_discord("點擊登入")

    #直接轉回簽錢頁面
    if @b.button(class: "pcmall-dailycheckin_3uUmyu").text.match?(/今日簽到獲得/)
      @b.button(class: "pcmall-dailycheckin_3uUmyu").click
      notify_discord("成功")
    else
      notify_discord("簽過了")
    end
    notify_discord("財富密碼就是積沙成塔")
  end

  def self.notify_discord(msg)
    @bot.send_message("961525720444727336", msg)
  end
end


