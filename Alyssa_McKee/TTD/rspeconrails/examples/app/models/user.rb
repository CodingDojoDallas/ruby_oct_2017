class User < ActiveRecord::Base
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :firstname, :lastname, :email, presence: true
	validates :email, uniqueness: true
	validates :email, format: {with: EMAIL_REGEX}
end
