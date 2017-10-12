class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :commentable

  validates :message, length: { minimum: 15}
  validates :author, :message, presence: true
end
