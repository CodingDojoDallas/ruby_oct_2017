class User < ActiveRecord::Base
    has_many :posts
    has_many :messages
    has_many :owners
    has_many :comments, as: :commentable


    validates :first_name,:last_name,:email, presence: true
    before_save :downcase_email
    private
    def downcase_email
        self.email.downcase!
    end  
end
