class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX= /.+@.+\..+/
  validates :first_name, :last_name, :email,  presence: true
  
  validates :password, :password_digest, presence: true, on: :create
  
  validates :first_name, :last_name, length: {minimum: 2}
  
  validates :email, format: {with: EMAIL_REGEX}, uniqueness: true
  
  before_save :email_to_lower
  
  private
	def email_to_lower
		self.email.downcase!
	end
end
