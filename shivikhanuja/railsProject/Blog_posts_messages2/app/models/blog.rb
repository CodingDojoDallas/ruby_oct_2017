class Blog < ActiveRecord::Base
    has_many :comments, as: :commentable
    validates :name,:description, presence: true
end
