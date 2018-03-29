class CompetitionInfo < ApplicationRecord
  validates :competition_class, inclusion: {in: [1, 2]}
end
