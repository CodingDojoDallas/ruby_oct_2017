class Location < ActiveRecord::Base
	@@states = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TX TN UT VT VA WA WV WI WY]
	
	has_many :users
	has_many :events
	
	
	validates :state, inclusion: {in: @@states}, presence: true
	validates :city, presence: true
	
	
	
  def self.states
	@@states
  end
  
  def self.get_or_create paramhash
		paramhash[:city].downcase!
		location = self.find_by(paramhash)
		if location
			return location
		end
		
		return self.create(paramhash)
  end
  
  private
	def email_to_lower
		self.email.downcase!
	end
  
end