class RunRecord < ApplicationRecord
  belongs_to :user
   has_one :weather_condition, dependent: :destroy
   has_one :competition_evaluation, dependent: :destroy
   has_one :body_state, dependent: :destroy

   accepts_nested_attributes_for :weather_condition, allow_destroy: true
   accepts_nested_attributes_for :competition_evaluation, allow_destroy: true
   accepts_nested_attributes_for :body_state, allow_destroy: true

   def self.calc_time(hour, minute, second)
     if hour.nil?
       minute*60 + second
     else
       hour*3600 + minute*60 + second
     end
   end
end
