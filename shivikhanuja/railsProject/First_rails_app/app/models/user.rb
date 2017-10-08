class User < ActiveRecord::Base
    has_many :posts
    has_many :comments


    validates :name,:email, presence: {message: 'Cannot be blank'}
    validates :password, length: {minimum: 4}
    before_save :downcase_email
    private
    def downcase_email
        self.email.downcase!
    end    
end
