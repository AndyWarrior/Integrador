class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
      t.integer :numphase
      t.integer :project_id

      t.timestamps null: false
    end
    add_index :phases, :project_id
  end
end
