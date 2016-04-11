class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :numstep
      t.integer :phase_id

      t.timestamps null: false
    end
    add_index :steps, :phase_id
  end
end
