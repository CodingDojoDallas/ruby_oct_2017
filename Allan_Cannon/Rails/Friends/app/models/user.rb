class User < ActiveRecord::Base
  has_many :friended, foreign_key: :friender_id, class_name: "Friendship"
  has_many :friends, through: :friended, source: :friendee

  has_many :frienders, foreign_key: :friendee_id, class_name: "Friendship"
  has_many :friended_by, through: :frienders, source: :friender
end
