class Post < ActiveRecord::Base
  belongs_to :blogg
  has_many :messages
  validates :title, :content, presence: true
end
