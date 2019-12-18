class Audit < ApplicationRecord
  belongs_to :user
  has_many :audit_workouts
  has_many :workouts, through: :audit_workouts

  validates :name, presence: true, length: { maximum: 40 }
  validates_uniqueness_of :name
end
