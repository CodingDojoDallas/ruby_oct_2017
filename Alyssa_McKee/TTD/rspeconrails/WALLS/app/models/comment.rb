class Comment < ActiveRecord::Base
  belongs_to :messege
  belongs_to :user
end
