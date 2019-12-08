class Workout < ApplicationRecord
  validates :title, presence: true, length: {maximum: 40}
  validates :description, presence: true
end
