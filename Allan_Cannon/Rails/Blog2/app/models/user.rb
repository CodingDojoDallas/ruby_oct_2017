class User < ActiveRecord::Base
  has_many :bloggs, through: :owners
  has_many :messages
  has_many :posts
end
