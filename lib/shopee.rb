require 'watir'


class Shopee
  attr_accessor :brower
  attr_accessor :init_status

  def initialize
    @init_status = false
    args = %w[]
    @brower = Watir::Browser.new :chrome, options: {args: args}
  end

  def self.close(brower)
    brower.goto("https://shopee.tw/me/setting")
    btn = browser.button(class: 'btn-bottom r14')
    sleep 3
    btn.click
    sleep 3
    brower.close
    @init_status = false
  end
end
