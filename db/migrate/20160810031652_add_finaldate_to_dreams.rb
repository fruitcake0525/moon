class AddFinaldateToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :finaldate, :date
  end
end
