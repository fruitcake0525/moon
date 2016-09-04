class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :mastergoal
      t.string :secondgoal
      t.string :success
      t.string :can
      t.string :how
      t.string :when
      t.boolean :owner_name

      t.timestamps null: false
    end
  end
end
