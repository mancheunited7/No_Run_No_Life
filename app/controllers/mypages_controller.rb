class MypagesController < ApplicationController
  def index
    @practices = RunRecord.where(run_class: 0, user_id: current_user.id).order(run_record_day: "DESC").first(5)
    @comp_results = RunRecord.where(run_class: 1, user_id: current_user.id)
    @comp_result_recent_five = @comp_results.order(run_record_day: "DESC").first(5)
    @comp_result_maps = CompetitionPlace.set_map(@comp_results)
    @best_time_list = RunRecord.best_time_calc(@comp_results)
    @user = User.find_by(id: current_user.id)
    @graph_data = current_user.run_records.order(:run_record_day).limit(10)
    @distance_data = @graph_data.pluck(:run_record_day, :run_distance)
    @comp_schedules = current_user.competition_infos
  end
end
