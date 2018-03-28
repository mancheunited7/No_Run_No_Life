class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @practices = RunRecord.where(run_class: 0, user_id: params[:id]).order(run_record_day: "DESC").first(5)
    @comp_results = RunRecord.where(run_class: 1, user_id: params[:id])
    @comp_result_recent_five = @comp_results.order(run_record_day: "DESC").first(5)
    @comp_result_maps = CompetitionPlace.set_map(@comp_results)
    @best_time_list = RunRecord.best_time_calc(@comp_results)
    @user = User.find_by(id: params[:user_id])
    @graph_data = current_user.run_records.order(:run_record_day).limit(10)
    @distance_data = @graph_data.pluck(:run_record_day, :run_distance)
    @comp_schedules = current_user.competition_infos
  end

  def recent_run_record
    @users = User.all
    @run_records = RunRecord.recent_run_record_find(@users)
  end

end
