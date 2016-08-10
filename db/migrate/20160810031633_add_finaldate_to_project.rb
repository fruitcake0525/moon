class AddFinaldateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :finaldate, :date
  end
end
