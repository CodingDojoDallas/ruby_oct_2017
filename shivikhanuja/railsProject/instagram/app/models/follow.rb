class Follow < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :follow, foreign_key: :follower_id, class_name: "User", required: true
end
