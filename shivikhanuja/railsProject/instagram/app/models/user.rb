class User < ApplicationRecord
    #who the user is following 
    has_many :follows, foreign_key: :user, class_name: "User"
    has_many :following, through: :follows, source: :follow

    # user.following [<User>, <User>]     to do this

    #who is following user

    #user.followers[<User>, <User>]    to get this

    has_many :ooga, foreign_key: :follow_id , class_name: "User"
    has_many :followers, through: :ooga, source: :user

end
