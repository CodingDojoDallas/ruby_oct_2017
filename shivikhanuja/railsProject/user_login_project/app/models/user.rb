class User < ActiveRecord::Base
    validates :first_name, :last_name, presence: true , length: { minimum:2 }
    validates :age, inclusion: { in: 10..150 }
    validates :email, presence: true
end
