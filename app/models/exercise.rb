class Exercise < ApplicationRecord
  has_one :workout

  has_many :audit_exercises
  has_many :audits, through: :audit_exercises

  accepts_nested_attributes_for :audit_exercises

  validates :title, presence: true, length: { minimum: 12, maximum: 40 }
  validates :description, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :description

  def completed?
    !completed_at.blank?
  end

end
