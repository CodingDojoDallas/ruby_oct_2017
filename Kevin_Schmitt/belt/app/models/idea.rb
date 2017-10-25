class Idea < ActiveRecord::Base
  belongs_to :user, required: true

  # has_many :events
  # has_many :ideas
  
  # has_many :messages
  # has_many :likes

  has_many :likes, dependent: :destroy
  has_many :liker, through: :likes, source: :user

  #many to many table needs the following two lines
  # has_many :attends
  # has_many :attending, through: :attends, source: :event
  #allows you to call an array of user's attending events with user.attending == [<event>, <event>, <event>]

  email_regex = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/

  before_save :capitalize#, :upcase
  validates :content, presence: true, length: { in: 7..75}
  # validates :city, presence: true, length: { in: 2..30 }
  # validates :state, presence: true, length: { is: 2 }


  # def downcase
  #   self.email.downcase!
  #   # self.name.downcase!
  # end
  def capitalize
    self.content.capitalize!
  end


end
