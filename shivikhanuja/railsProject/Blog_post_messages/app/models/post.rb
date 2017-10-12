class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :messages

  validates :title, presence: true
  validates :content, presence: true , length: {minimum: 7}
end
