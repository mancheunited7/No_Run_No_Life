module MypagesHelper
  def run_time(result)
    #{}"#{result.run_hour&.to_s&.+'時間'}#{result.run_minute&.to_s&.+'分'}#{result.run_second&.to_s&.+'秒'}"
  end

  def run_distance(result)
    result.run_distance.to_s.concat("km")
  end

  def comp_point(result)
    result.competition_evaluation.competition_point.to_s.concat("点")
  end

  def day_temperature(result)
    result.weather_condition.day_temperature.to_s.concat("℃")
  end

  def day_humidity(result)
    result.weather_condition.day_humidity.to_s.concat("%")
  end

  def day_wind_speed(result)
    result.weather_condition.day_wind_speed.to_s.concat("m/s")
  end

  def day_weight(result)
    result.body_state.day_weight.to_s.concat("kg")
  end

  def day_body_fat(result)
    result.body_state.day_body_fat.to_s.concat("%")
  end
end
