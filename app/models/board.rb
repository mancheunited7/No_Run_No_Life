class Board < ApplicationRecord
  has_many :comments, dependent: :destroy
end
