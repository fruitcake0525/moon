class AddOwnerNameToProject < ActiveRecord::Migration
  def change
    add_column :projects, :owner_name, :boolean, default: false
  end
end
