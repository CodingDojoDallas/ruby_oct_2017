class Event < ActiveRecord::Base
  belongs_to :host, class_name: "User", inverse_of: "hosted_events", foreign_key: 'user_id'
  
  belongs_to :location
  
  has_many :attends, :dependent => :destroy
  has_many :users, through: :attends
  
  has_many :comments, :dependent => :destroy
  
  validates :name, :location, :date, presence: true
  
  validates :name, length: {minimum: 5}
  
  validate :date_format_and_future_dated
  
  
	private
	  def date_format_and_future_dated
		if date.present? && date < Date.today.prev_day
			errors.add(:date, 'must be today or in the future')
		end
	  end
  
end
