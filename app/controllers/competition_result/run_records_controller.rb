class CompetitionResult::RunRecordsController < ApplicationController
  def new
    @comp_result = RunRecord.new
    @comp_result.build_weather_condition
    @comp_result.build_body_state
    @comp_result.build_competition_evaluation
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
end

private

def comp_result_params
  params.require(:run_record).permit(:run_record_day, :run_distance, :run_hour, :run_minute, :run_second, :run_content, weather_condition_attributes: [:day_weather, :day_temperature, :day_humidity, :day_wind_speed], body_state_attributes: [:heart_rate, :day_weight, :day_body_fat], competition_evaluation_attributes: [:competition_point, :competition_evaluation])
end
