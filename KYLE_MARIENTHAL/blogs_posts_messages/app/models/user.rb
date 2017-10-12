class User < ActiveRecord::Base
  has_many :posts
  has_many :messages
  has_many :owners
  has_many :blogs, through: :owners

  validates :first_name, :last_name, :email, length: { minimum: 2}
  validates :first_name, :last_name, :email, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
