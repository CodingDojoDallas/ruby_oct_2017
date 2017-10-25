class Message < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :event

  validates :content, presence: true, length: { minimum: 7 }
end
