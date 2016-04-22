class Program < ActiveRecord::Base
	has_many :projects, dependent: :destroy
	serialize :images, Array
	mount_uploaders :images, ImageUploader
end
