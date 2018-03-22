class CreateWeatherConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_conditions do |t|
      t.references :run_record, foreign_key: true
      t.string :day_weather
      t.decimal :day_temperature
      t.decimal :day_humidity
      t.decimal :day_wind_speed

      t.timestamps
    end
  end
end
