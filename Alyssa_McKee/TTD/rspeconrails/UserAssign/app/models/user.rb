class User < ActiveRecord::Base
  has_secure_password
  
   has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  
  EMAIL_REGEX= /.+@.+\..+/
  
  validates :email, :name, presence: true
  validates :password, :password_digest, presence: true, on: :create
  validates :email, format: {with: EMAIL_REGEX}, uniqueness: true
  
  before_save :email_to_lower
  
  private
	def email_to_lower
		self.email.downcase!
	end
  
end
