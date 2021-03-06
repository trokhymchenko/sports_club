class Audit < ApplicationRecord
  belongs_to :user
  has_many :audit_workouts
  has_many :workouts, through: :audit_workouts

  accepts_nested_attributes_for :audit_workouts

  has_many :audit_exercises
  has_many :exercises, through: :audit_exercises

  accepts_nested_attributes_for :audit_exercises

  validates :name, presence: true, length: { maximum: 40 }
  validates_uniqueness_of :name
end
