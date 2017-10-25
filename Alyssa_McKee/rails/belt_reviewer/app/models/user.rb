class User < ActiveRecord::Base
  has_secure_password
  
  belongs_to :location
  
  has_many :hosted_events, class_name: "Event", foreign_key: 'user_id', :dependent => :destroy
  
  has_many :attends, :dependent => :destroy
  has_many :events, through: :attends
  
  has_many :comments, :dependent => :nullify
  
  EMAIL_REGEX= /.+@.+\..+/
  validates :first_name, :last_name, :email,  presence: true
  
  validates :password, :password_confirmation, presence: true, on: :create
  
  validates :first_name, :last_name, length: {minimum: 2}
  
  validates :email, format: {with: EMAIL_REGEX}, uniqueness: true
  
  validates :location, presence: true
  
  before_save :email_to_lower
  
  private
	def email_to_lower
		self.email.downcase!
	end
end
