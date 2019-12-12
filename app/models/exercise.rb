class Exercise < ApplicationRecord
  has_many :exercise_workouts
  has_many :workouts, through: :exercise_workouts
  
  validates :title, presence: true, length: { minimum: 12, maximum: 40 }
  validates :description, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :description
end
