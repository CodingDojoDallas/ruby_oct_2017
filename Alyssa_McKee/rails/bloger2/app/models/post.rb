class Post < ActiveRecord::Base
  belongs_to :blog, required: true
  belongs_to :user, required: true
  has_many :comments, as: :commentable
  
  has_many :messages, :dependent => :destroy
  
  validates :title, :content, presence: true
  validates :title, length: {minimum: 5}
  validates :content, length: {minimum: 15}
end
