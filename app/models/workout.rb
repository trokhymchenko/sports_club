class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts

  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true
  validates :user_id, presence: true
  validates :question_title, presence: true, length: { minimum: 12, maximum: 40 }
  validates :question_description, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :description
  validates_uniqueness_of :question_title
  validates_uniqueness_of :question_description

  def completed?
    !completed_at.blank?
  end
end
