class RunRecord < ApplicationRecord
  belongs_to :user
  has_one :weather_condition
  has_one :competition_evaluation
  has_one :body_state
end
