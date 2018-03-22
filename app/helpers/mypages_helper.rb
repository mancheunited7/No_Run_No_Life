module MypagesHelper
  def run_time(result)
    "#{result.run_hour&.to_s&.+'時間'}#{result.run_minute&.to_s&.+'分'}#{result.run_second&.to_s&.+'秒'}"
  end

  def run_distance(result)
    result.run_distance.to_s.concat("km")
  end

  def comp_point(result)
    result.competition_point.to_s.concat("点")
  end
end
