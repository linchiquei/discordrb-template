require 'watir'

class Handlers::WahahaHandler

  def initialize(bot)
    @bot = bot
    args = %w[--headless --no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222]
    @b = Watir::Browser.new :chrome, options: {args: args}
  end

  def run
    begin
      @b.goto(ENV['WAHAHA_URL'])
      btn = @b.button :class => 'pcmall-dailycheckin_3uUmyu'
      btn.click
  
      nt = @b.text_field :name => 'loginKey'
      nt.set ENV["WA"]
      nt.value
  
      pt = @b.text_field :name => 'password'
      pt.set ENV["HAHA"]
      pt.value
  
      sleep 5
  
      yyy = @b.button :class => "wyhvVD _1EApiB hq6WM5 L-VL8Q cepDQ1 _7w24N1"
      yyy.click
  
      ooo = @b.button :class => 'pcmall-dailycheckin_3uUmyu'
      if ooo.text != ENV["HA"]
        ooo.click
        send_run_status("成功")
      else
        send_run_status("簽過了")
      end
    rescue => exception
      send_run_status(exception)
    end
  end

  private

  def send_run_status(msg)
    @bot.send_message("961525720444727336", msg)
    @b.close
  end
end


