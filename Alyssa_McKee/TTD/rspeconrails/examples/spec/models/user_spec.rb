require 'rails_helper'
RSpec.describe User, type: :model do
  context "With valid attributes" do 
    it "should save" do 
      user = User.new(
        firstname: 'shane',
        lastname: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(user).to be_valid
    end
  end
  
  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
        user = User.new(
            firstname: "", 
            lastname: 'chang', 
            email: 'schang@codingdojo.com')
      expect(user).to be_invalid
    end
    
    it "should not save if last_name field is blank" do
		user = User.new(
			firstname: "Izuku",
			lastname: "",
			email: "Iwannabeahero@yuuei.com"
		)
		expect(user).to be_invalid
	end
    
    it "should not save if email already exists" do
		user = User.create(
			firstname: "izuku",
			lastname: "midoriya",
			email: "iwannabeahero@yuuei.com"
		)
		
		user2 = User.new(
			firstname: "katsuki",
			lastname: "bakugo",
			email: "iwannabeahero@yuuei.com"
		)
		
		expect(user2).to be_invalid
	end
    
    it "should contain a valid email" do
		user = User.create(
			firstname: "Katsuki",
			lastname: "Bakugo",
			email: "lolnope",
		)
		expect(user).to be_invalid
	end
  end
end