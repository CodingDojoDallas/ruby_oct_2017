class Dojo < ActiveRecord::Base

    has_many :ninjas

    validates :name,:city, presence: true
    validates :state, length: {minimum:2}
end
