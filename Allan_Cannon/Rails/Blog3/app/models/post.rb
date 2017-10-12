class Post < ActiveRecord::Base
  belongs_to :blogg
  belongs_to :user
  has_many :messages
  has_many :comments, as: :commentable
end
