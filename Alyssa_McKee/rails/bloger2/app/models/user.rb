class User < ActiveRecord::Base
	has_many :owners
	has_many :blogs, through: :owners
	has_many :posts
	has_many :comments, as: :commentable
	has_many :messages, :dependent => :destroy
	
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	
	validates :first_name, :last_name, :email_address, presence: true
	validates :email_address, format: {with: EMAIL_REGEX}
	
	
end
