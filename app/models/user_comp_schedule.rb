class UserCompSchedule < ApplicationRecord
  belongs_to :user
  belongs_to :competition_info
end
