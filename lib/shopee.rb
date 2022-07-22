require 'watir'

class Shopee
  attr_accessor :brower

  def initialize
    #--headless
    args = %w[--no-sandbox --disable-dev-shm-usage --disable-gpu --remote-debugging-port=9222]
    @brower = Watir::Browser.new :chrome, options: {args: args}
  end
end
