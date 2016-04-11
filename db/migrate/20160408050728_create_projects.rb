class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :program_id

      t.timestamps null: false
    end
    add_index :projects, :program_id
  end
end
