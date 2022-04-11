require 'ostruct'
require 'oj'

module JsonClean

  TYPE = {
    "狀態" => 0,
    "下雨機率" => 1,
    "最低氣溫" => 2,
    "最高氣溫" => 4,
  }.freeze

  def self.get_weather_params(data)
    clean_data = Oj.load(data, mode: :compat, object_class: OpenStruct)
    weather_data = clean_data.records.location.first.weatherElement
    res = OpenStruct.new(
      local: clean_data.records.location.first.locationName,
      state: weather_data[TYPE["狀態"]].time.first.parameter.parameterName,
      rain: weather_data[TYPE["下雨機率"]].time.first.parameter.parameterName,
      min: weather_data[TYPE["最低氣溫"]].time.first.parameter.parameterName,
      max: weather_data[TYPE["最高氣溫"]].time.first.parameter.parameterName,
    )
    res
  end
end



