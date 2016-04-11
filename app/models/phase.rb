class Phase < ActiveRecord::Base
	belongs_to :project
	has_many :steps, dependent: :destroy
	validates :project, presence: true
end
