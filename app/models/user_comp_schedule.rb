class UserCompSchedule < ApplicationRecord
  belongs_to :user_id
  belongs_to :competition_info_id
end
