require 'watir'

class Handlers::WahahaHandler
  def self.run(bot)
    @bot = bot
    @b = get_brower
    begin
      @b.goto(ENV['WAHAHA_URL'])
      btn = @b.button :class => 'pcmall-dailycheckin_3uUmyu'
      sleep 3
      btn.click
  
      nt = @b.text_field :name => 'loginKey'
      nt.set ENV["WA"]
      nt.value
      pt = @b.text_field :name => 'password'
      pt.set ENV["HAHA"]
      pt.value
  
      yyy = @b.button :class => "wyhvVD _1EApiB hq6WM5 L-VL8Q cepDQ1 _7w24N1"
      sleep 3
      yyy.click
  
      ooo = @b.button :class => 'pcmall-dailycheckin_3uUmyu'
      sleep 3
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

  def self.get_brower
    args = %w[--headless --no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222]
    Watir::Browser.new :chrome, options: {args: args}
  end


  def self.send_run_status(msg)
    @bot.send_message("961525720444727336", msg)
    @b.close
  end
end


