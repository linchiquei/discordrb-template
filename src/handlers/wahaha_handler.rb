require "./lib/shopee"

class Handlers::WahahaHandler
  def self.run(bot, brower, start)
    @bot = bot
    @b = brower
    @start = start
    begin
      @b.goto("https://shopee.tw/shopee-coins/")
      coin_btn = @b.button :class => 'pcmall-dailycheckin_3uUmyu'
      sleep 3

      if @start
        check_status(coin_btn)
      else
        coin_btn.click
        name_text = @b.text_field :name => 'loginKey'
        name_text.set "cclok922"
        name_text.value
        pass_text = @b.text_field :name => 'password'
        pass_text.set "K089570ze"
        pass_text.value
    
        sign_btn = @b.button :class => "wyhvVD _1EApiB hq6WM5 L-VL8Q cepDQ1 _7w24N1"
        sleep 3
        sign_btn.click
        sleep 3
        check_status(coin_btn)
      end
    rescue => exception
      send_run_status(exception)
      Shopee.close(@b)
    end
  end

  def self.check_status(btn)
    if btn.text.match?(/今日簽到獲得/)
      btn.click
      send_run_status("成功")
    else
      send_run_status("簽過了")
    end
  end

  def self.send_run_status(msg)
    @bot.send_message("961525720444727336", msg)
  end
end


