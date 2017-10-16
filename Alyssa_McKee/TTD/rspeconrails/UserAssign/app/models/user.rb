class User < ActiveRecord::Base
  has_secure_password
  
  EMAIL_REGEX= /.+@.+\..+/
  
  validates :email, :name, :password, :password_digest, presence: true
  validates :email, format: {with: EMAIL_REGEX}, uniqueness: true
  
  before_save :email_to_lower
  
  private
	def email_to_lower
		self.email.downcase!
	end
  
end
