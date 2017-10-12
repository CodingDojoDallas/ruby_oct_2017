class Dojo < ActiveRecord::Base
  has_many :ninjas
  validates :name, :state, :city, presence: true
  validates :state, length: {is: 2}
end
