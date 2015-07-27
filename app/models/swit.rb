class Swit < ActiveRecord::Base
	belongs_to :user
	has_many :swit_comments
	has_many :swit_statuses
end
