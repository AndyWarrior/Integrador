class AddImagesToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :images, :text
  end
end
