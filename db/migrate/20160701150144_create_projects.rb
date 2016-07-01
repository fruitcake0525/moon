class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :mastergoal
      t.string :secondgoal
      t.string :success
      t.string :can
      t.string :how
      t.string :when
      t.string :string

      t.timestamps null: false
    end
  end
end
