class Practice::RunRecordsController < ApplicationController
  before_action :set_run_record, only:[:show, :edit, :update, :destroy]
  def new
    @practice = RunRecord.new
    @practice.build_weather_condition
    @practice.build_body_state
  end

  def create
    @practice = RunRecord.new(practice_params)
    @practice.user_id = current_user.id
    @practice.run_class = 0
    @practice.run_calc_time = RunRecord.calc_time(@practice)
    User.run_level_up_decision(@practice)
    if @practice.save
      redirect_to mypages_path, notice: t('flash.practice.create')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @practice.update(practice_params)
      redirect_to mypages_path, notice: t('flash.practice.update')
    else
      render :edit
    end
  end

  def destroy
    @practice.destroy
    redirect_to mypages_path, notice: t('flash.practice.destroy')
  end
end

private

def set_run_record
  @practice = RunRecord.find(params[:id])
end

def practice_params
  params.require(:run_record).permit(:run_record_day, :run_distance, :run_hour, :run_minute, :run_second, :run_content, weather_condition_attributes: [:id, :day_weather, :day_temperature, :day_humidity, :day_wind_speed], body_state_attributes: [:id, :heart_rate, :day_weight, :day_body_fat])
end
