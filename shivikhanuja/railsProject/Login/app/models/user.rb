class User < ApplicationRecord
  has_secure_password

  email_regex = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  before_save :downcase

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness:true, format: { with: email_regex}

  def downcase
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
  end  
end
