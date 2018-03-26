class CompetitionInfo < ApplicationRecord
  has_many :user_comp_schedules, dependent: :destroy
  has_many :users, through: :user_comp_schedules
end
