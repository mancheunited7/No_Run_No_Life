class RunRecord < ApplicationRecord
  belongs_to :user
   has_one :weather_condition, dependent: :destroy
   has_one :competition_evaluation, dependent: :destroy
   has_one :body_state, dependent: :destroy
   has_one :competition_place, dependent: :destroy

   accepts_nested_attributes_for :weather_condition, allow_destroy: true
   accepts_nested_attributes_for :competition_evaluation, allow_destroy: true
   accepts_nested_attributes_for :body_state, allow_destroy: true
   accepts_nested_attributes_for :competition_place, allow_destroy: true

   def self.calc_time(hour, minute, second)
     if hour.nil?
       minute*60 + second
     else
       hour*3600 + minute*60 + second
     end
   end

   def self.best_time_calc(comp_result)
     best_time_list = {}
     [5, 10, 21.0975, 42.195, 100].each do |distance|
       best_time_list[distance] = comp_result.where(run_distance: distance).order(:run_calc_time).first
     end
     best_time_list
   end

end
