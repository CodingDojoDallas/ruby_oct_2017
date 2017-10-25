class Like < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :idea, required: true


  # using counter cache
  # need to add like_count to secrets
  # belongs_to :user, required: true
  # belongs_to :idea, counter_cache: true, required: true
end
