class Workout < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {maximum: 40}
  validates :description, presence: true

  def completed?
    !completed_at.blank?
  end
end
