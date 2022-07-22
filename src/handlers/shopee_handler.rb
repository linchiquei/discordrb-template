require "./lib/shopee"

class Handlers::ShopeeHandler
  def self.run(bot, shopee)
    @bot = bot
    @b = shopee.brower

    @b.goto("https://shopee.tw/shopee-coins/")
    coin_btn = @b.button :class => "pcmall-dailycheckin_3uUmyu"
    check_exists?(coin_btn, "簽錢按鈕")
    coin_btn.click

    name_text = @b.text_field :placeholder => "電話號碼/使用者名稱/Email"
    check_exists?(name_text, "輸入名字")
    name_text.set ENV['WA']
    name_text.value

    pass_text = @b.text_field :placeholder => "密碼"
    check_exists?(pass_text, "輸入密碼")
    pass_text.set ENV['HAHA']
    pass_text.value

    sign_btn = @b.button :class => "wyhvVD _1EApiB hq6WM5 L-VL8Q cepDQ1 _7w24N1"
    check_exists?(sign_btn, "登入按鈕")
    sign_btn.click

    #直接轉回簽錢頁面
    check_status(coin_btn)
    sleep 3
    @b.close
  end

  def self.check_exists?(o, msg)
    sleep 3
    if !o.exists?
      info = "找不到 #{msg}"
      puts info
      notify_discord(info)
      @b.close
    end
  end

  def self.check_status(btn)
    sleep 3
    if btn.text.match?(/今日簽到獲得/)
      btn.click
      notify_discord("成功")
    else
      notify_discord("簽過了")
    end
  end

  def self.notify_discord(msg)
    @bot.send_message("961525720444727336", msg)
  end
end


