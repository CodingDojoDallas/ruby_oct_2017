class User < ActiveRecord::Base
  has_secure_password

  # has_many :events

  # has_many :messages

  #many to many table needs the following two lines
  # has_many :attends
  # has_many :attending, through: :attends, source: :user
  #allows you to call an array of user's attending events with user.attending == [<event>, <event>, <event>]

  email_regex = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  before_save :downcase, :capitalize#, :upcase
  validates :first_name, :last_name, presence: true, length: { in: 2..20}
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
  # validates :city, presence: true, length: { in: 2..30 }
  # validates :state, presence: true, length: { is: 2 }


  def downcase
    self.email.downcase!
    # self.name.downcase!
  end
  def capitalize
    self.first_name.capitalize!
    self.last_name.capitalize!
  end





end
