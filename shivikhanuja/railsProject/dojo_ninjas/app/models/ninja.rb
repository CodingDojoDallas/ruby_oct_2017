class Ninja < ActiveRecord::Base
  belongs_to :dojo

  validates :fisrt_name,:last_name, presence: true
end
