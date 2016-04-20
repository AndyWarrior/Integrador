class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :street, :string
  	add_column :users, :neighborhood, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :zip_code, :string
  	add_column :users, :telephone, :string
  	add_column :users, :people_living, :integer
  	add_column :users, :rooms, :integer
  	add_column :users, :wall_material, :string
  	add_column :users, :roof_material, :string
  	add_column :users, :floor_material, :string
  	add_column :users, :build_yourself, :string
  	add_column :users, :store, :string
  end
end
