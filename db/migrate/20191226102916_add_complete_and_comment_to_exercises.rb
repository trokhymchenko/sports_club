class AddCompleteAndCommentToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :complete, :text
    add_column :exercises, :comment, :text
  end
end
