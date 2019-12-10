class Workout < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {maximum: 40}
  validates :description, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :description

  def completed?
    !completed_at.blank?
  end
end
