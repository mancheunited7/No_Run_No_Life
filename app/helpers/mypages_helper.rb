module MypagesHelper
  def run_time(result)
    unless result.blank?
      unless result.run_hour.nil?
        hour = result.run_hour.to_s + "時間"
      else
        hour = ""
      end
      unless result.run_minute.nil?
        minute = result.run_minute.to_s + "分"
      else
        minute = ""
      end
      unless result.run_second.nil?
        second = result.run_second.to_s + "秒"
      else
        second = ""
      end
      hour + minute + second
    else
      return ""
    end
  end

  def run_distance(result)
    result.run_distance.to_s + "km"
  end

  def comp_point(result)
    result.competition_point.to_s + "点"
  end
end
