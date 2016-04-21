class AddProjectToUser < ActiveRecord::Migration
  def change
  	add_column :users, :program, :string
  	add_column :users, :project, :string
  	add_column :users, :phase, :string
  	add_column :users, :step, :string
  end
end
