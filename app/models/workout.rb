class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :audit_workouts
  has_many :audits, through: :audit_workouts

  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :description

  def completed?
    !completed_at.blank?
  end
end
