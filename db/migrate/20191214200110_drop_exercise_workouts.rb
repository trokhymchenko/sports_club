class DropExerciseWorkouts < ActiveRecord::Migration[5.1]
  def change
    drop_table :exercise_workouts
    remove_column :exercises, :user_id
    remove_column :workouts, :question_title
    remove_column :workouts, :question_description
    add_column :exercises, :workout_id, :integer
    add_foreign_key :exercises, :workouts, column: :workout_id, primary_key: :id
  end
end
