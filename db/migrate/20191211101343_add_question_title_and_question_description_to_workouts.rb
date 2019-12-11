class AddQuestionTitleAndQuestionDescriptionToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :question_title, :string
    add_column :workouts, :question_description, :text
  end
end
