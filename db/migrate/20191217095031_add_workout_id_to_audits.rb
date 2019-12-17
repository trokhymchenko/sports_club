class AddWorkoutIdToAudits < ActiveRecord::Migration[5.1]
  def change
    add_column :audits, :workout_id, :integer
  end
end
