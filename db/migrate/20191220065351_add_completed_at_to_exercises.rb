class AddCompletedAtToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :completed_at, :datetime
  end
end
