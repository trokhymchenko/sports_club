class AuditExercise < ApplicationRecord
  belongs_to :audit
  belongs_to :exercise
end