class User < ActiveRecord::Base
  validates :first_name, :last_name, :email_address, :age, presence: true
  validates_numericality_of :age, greater_than: 9, less_than: 150, only_integer: true
  validates :first_name, :last_name, length: {in: 2..50}
end
