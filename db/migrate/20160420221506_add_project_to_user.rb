class AddProjectToUser < ActiveRecord::Migration
  def change
  	add_column :users, :program, :string
  	add_column :users, :project, :string
  	add_column :users, :phase, :integer
  	add_column :users, :step, :integer
  end
end
