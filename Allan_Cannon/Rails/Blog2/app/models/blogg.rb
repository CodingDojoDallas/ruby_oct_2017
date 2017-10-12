class Blogg < ActiveRecord::Base
  has_many :posts
  has_many :users, through: :owners
end
