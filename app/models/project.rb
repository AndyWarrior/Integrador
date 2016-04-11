class Project < ActiveRecord::Base
	belongs_to :program
	has_many :phases, dependent: :destroy
	validates :program, presence: true
end
