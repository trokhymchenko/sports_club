class Audit < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :workouts
end