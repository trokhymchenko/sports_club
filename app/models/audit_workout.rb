class AuditWorkout < ApplicationRecord
  belongs_to :audit
  belongs_to :workout
end