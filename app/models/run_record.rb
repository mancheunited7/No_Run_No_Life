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

   def self.calc_time(comp_result)
     if comp_result.run_hour.nil?
       comp_result.run_minute*60 + comp_result.run_second
     else
       comp_result.run_hour*3600 + comp_result.run_minute*60 + comp_result.run_second
     end
   end

   def self.best_time_calc(comp_result)
     best_time_list = {}
     [5, 10, 21.0975, 42.195, 100].each do |distance|
       best_time_list[distance] = comp_result.where(run_distance: distance).order(:run_calc_time).first
     end
     best_time_list
   end

   def self.recent_run_record_find(users)
     run_records = {}
     users.each do |user|
       runrecord = RunRecord.where(user_id: user.id).order("run_record_day DESC").first
       unless runrecord.nil?
         run_records[user.id] = runrecord
       end
     end
     run_records
   end

end
