class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :comments, as: :commentable

  validates :content, length: { minimum: 7}
  validates :title, :content, presence: true
end
