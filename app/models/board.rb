class Board < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :comments, associated: true
end
