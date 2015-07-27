class SwitStatus < ActiveRecord::Base
	enum status: [:sweet, :sour]
	belongs_to :user
	belongs_to :swit
end
