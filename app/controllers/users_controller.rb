class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.page(params[:page]).per(10).order(created_at: "DESC")
  end

  def show
    @practices = RunRecord.where(run_class: 0, user_id: params[:id]).order(run_record_day: "DESC").first(5)
    @comp_results = RunRecord.where(run_class: 1, user_id: params[:id])
    @comp_result_recent_five = @comp_results.order(run_record_day: "DESC").first(5)
    @comp_result_maps = CompetitionPlace.set_map(@comp_results)
    @best_time_list = RunRecord.best_time_calc(@comp_results.where(run_distance: [5, 10, 21.0975, 42.195, 100]))
    @user = User.find(params[:id])
    @comp_schedules = @user.competition_infos
    User.run_level_up_decision(@user.id)
  end

  def recent_run_record
    @users = User.all
    @run_records = RunRecord.recent_run_record_find(@users)
  end

end
