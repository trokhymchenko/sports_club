class Exercise < ApplicationRecord
  has_one :workout

  validates :title, presence: true, length: { minimum: 12, maximum: 40 }
  validates :description, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :description
end
