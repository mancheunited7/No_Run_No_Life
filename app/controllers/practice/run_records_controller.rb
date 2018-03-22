class Practice::RunRecordsController < ApplicationController
  def new
    @practice = RunRecord.new
    @practice.build_weather_condition
    @practice.build_body_state
  end

  def create
    @practice = RunRecord.new(practice_params)
    @practice.user_id = current_user.id
    @practice.run_class = 0
    @practice.run_calc_time = RunRecord.calc_time(@practice.run_hour, @practice.run_minute, @practice.run_second)
    if @practice.save
      redirect_to mypages_path, notice: t('flash.practice.create')
    else
      render :new
    end
  end
end

private

def practice_params
  params.require(:run_record).permit(:run_record_day, :run_distance, :run_hour, :run_minute, :run_second, :run_content, weather_condition_attributes: [:day_weather, :day_temperature, :day_humidity, :day_wind_speed], body_state_attributes: [:heart_rate, :day_weight, :day_body_fat])
end
