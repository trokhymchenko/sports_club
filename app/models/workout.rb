class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises

  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :description

  def completed?
    !completed_at.blank?
  end
end
