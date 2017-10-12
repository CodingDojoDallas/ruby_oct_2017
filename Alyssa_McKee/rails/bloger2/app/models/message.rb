class Message < ActiveRecord::Base
  belongs_to :post, :dependent => :destroy, required: true
  belongs_to :user, required: true
  has_many :comments, as: :commentable
  
  validates :author, :message, presence: true
  validates :message, :author, length: {minimum: 8}
end
