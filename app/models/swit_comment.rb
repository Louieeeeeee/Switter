class SwitComment < ActiveRecord::Base
	belongs_to :user
	belongs_to :swit
	validates :comment, presence: true
end
