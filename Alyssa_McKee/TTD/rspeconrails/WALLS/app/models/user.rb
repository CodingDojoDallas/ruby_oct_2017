class User < ActiveRecord::Base
  has_many :messsages
  has_many :comments

end
