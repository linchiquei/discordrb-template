require 'csv'

module Mapping
  def self.get_local_name(name)
    return "臺北市" if name == nil
    if name.size == 1
      return "臺北市"
    else
      r = name.to_s.strip
      case r
      when /台北/, /臺北/
        return "臺北市"
      when /台中/, /臺中/
        return "臺中市"
      when /台南/, /臺南/
        return "臺南市"
      when /台東/, /臺東/
        return "臺東縣"
      when /新北/
        return "新北市"
      when /金門/
        return "金門縣"
      when /澎湖/
        return "澎湖縣"
      when /新竹/
        return "新竹縣"
      when /宜蘭/
        return "宜蘭縣"
      when /高雄/
        return "高雄市"
      when /嘉義/
        return "嘉義縣"
      when /花蓮/
        return "花蓮縣"
      when /雲林/
        return "雲林縣"
      when /苗栗/
        return "苗栗縣"
      when /桃園/
        return "桃園市"
      when /彰化/
        return "彰化縣"
      when /屏東/
        return "屏東縣"
      when /南投/
        return "南投縣"
      when /基隆/
        return "基隆市"
      when /連江/
        return "連江縣"
      else
        return "臺北市"
      end
    end
  end

  def self.get_weather_icon(state)
    weather_url = 'https://i.imgur.com/VznE4pZ.png'
    CSV.foreach(("./lib/csv/weather_icon.csv"), headers: true) do |row|
      if row['state'] == state.to_s
        weather_url = Time.now.hour >= 18 || Time.now.hour <= 6 ? row['night'] : row['day']
        break
      end
    end
    weather_url
  end
end



