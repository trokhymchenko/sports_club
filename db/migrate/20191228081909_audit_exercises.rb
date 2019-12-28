class AuditExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :audit_exercises do |t|
      t.integer :audit_id
      t.integer :exercise_id
      t.text :complete
      t.text :comment
      t.timestamps
    end
  end
end
