class Owner < ActiveRecord::Base
  belongs_to :user, required: true, :dependent => :destroy
  belongs_to :blog, required: true
end
