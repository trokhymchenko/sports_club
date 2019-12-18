class AddAuditNameToTheAuditTable < ActiveRecord::Migration[5.1]
  def change
    add_column :audits, :name, :string
  end
end
