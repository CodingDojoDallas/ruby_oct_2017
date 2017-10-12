class Blog < ActiveRecord::Base
	has_many :posts, :dependent => :destroy
	has_many :comments, as: :commentable
	
	has_many :owners
	has_many :users, through: :owners
	
	validates :name, :description, presence: true
	validates :name, length: {minimum: 4}
	validates :description, length: {minimum: 15}
end
