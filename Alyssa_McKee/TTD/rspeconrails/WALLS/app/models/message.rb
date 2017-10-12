class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :wall
  
  has_many :comments
end
