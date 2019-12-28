class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :exercises, :complete
    remove_column :exercises, :comment
  end
end
