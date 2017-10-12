class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blogg
  has_many :messages
end
