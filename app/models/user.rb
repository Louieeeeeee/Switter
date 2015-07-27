class User < ActiveRecord::Base
	has_secure_password
	validates :username, length: { minimum: 6, maximum: 24 }, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 6, maximum: 24 }
	validates :password_confirmation, presence: true

	has_many :swits
	has_many :swit_comments
	has_many :swit_statuses

end
