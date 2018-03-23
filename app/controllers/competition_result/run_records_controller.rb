class CompetitionResult::RunRecordsController < ApplicationController
  before_action :set_comp_result, only:[:show, :edit, :update, :destroy]
  def new
    @comp_result = RunRecord.new
    @comp_result.build_weather_condition
    @comp_result.build_body_state
    @comp_result.build_competition_evaluation
    @comp_result.build_competition_place
  end

  def create
    @comp_result = RunRecord.new(comp_result_params)
    @comp_result.user_id = current_user.id
    @comp_result.run_class = 1
    @comp_result.run_calc_time = RunRecord.calc_time(@comp_result.run_hour, @comp_result.run_minute, @comp_result.run_second)
    if @comp_result.save
      redirect_to mypages_path, notice: t('flash.comp_result.create')
    else
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @comp_result.update(comp_result_params)
      redirect_to mypages_path, notice: t('flash.comp_result.update')
    else
      render :edit
    end
  end

  def destroy
    @comp_result.destroy
    redirect_to mypages_path, notice: t('flash.comp_result.destroy')
  end

end

private


def set_comp_result
  @comp_result = RunRecord.find(params[:id])
end

def comp_result_params
  params.require(:run_record).permit(:user_id, :run_record_day, :run_distance, :run_hour, :run_minute, :run_second, :run_content,
    weather_condition_attributes: [:id, :day_weather, :day_temperature, :day_humidity, :day_wind_speed],
    body_state_attributes: [:id, :heart_rate, :day_weight, :day_body_fat],
    competition_evaluation_attributes: [:id, :competition_point, :competition_evaluation],
    competition_place_attributes: [:id, :competition_place_address, :competition_place_latitude, :competition_place_longitude])
end
