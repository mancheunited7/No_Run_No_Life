class UserCompSchedulesController < ApplicationController
  def create
    @user_comp_schedule = UserCompSchedule.new(user_comp_schedule_params)
    if @user_comp_schedule.save
      redirect_to competition_infos_path
    else
      render 'competition_infos/index', notice: t('flash.cmp_shcedule.create')
    end
  end

  private
  def user_comp_schedule_params
    params.require(:user_comp_schedule).permit(:user_id, :competition_info_id)
  end
end
