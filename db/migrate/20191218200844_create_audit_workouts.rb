class CreateAuditWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :audit_workouts do |t|
      t.integer :audit_id
      t.integer :workout_id
    end
  end
end
