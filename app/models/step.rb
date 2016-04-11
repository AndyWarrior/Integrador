class Step < ActiveRecord::Base
	belongs_to :phase
	validates :phase, presence: true
end
