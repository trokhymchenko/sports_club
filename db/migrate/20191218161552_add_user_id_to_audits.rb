class AddUserIdToAudits < ActiveRecord::Migration[5.1]
  def change
    add_column :audits, :user_id, :integer
  end
end
