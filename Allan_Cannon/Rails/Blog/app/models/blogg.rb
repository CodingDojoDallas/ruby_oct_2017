class Blogg < ActiveRecord::Base
  has_many :posts
  validates :name, :description, presence: true
end
