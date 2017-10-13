require 'rails_helper'

RSpec.describe User, type: :model do
  context "with registration" do
	context "with valid attributes"	
		it "should save" do
			expect(build(:user)).to be_valid
		end
	end #valid attributes
	context "with invalid attributes"
		it "should not save if username is empty" do
			expect(build(:user, username: "")).to be_invalid
		end
		it "should not save if username is taken" do
			user1 = User.create(username: "bob", iconname: "maria")
			user2 = User.create(username: "bob", iconname: "rose")
			expect(user2).to be_invalid
		end
		it "should not save if username is less than 6 characters" do
			expect(build(:user, username: "abc"))
		end
				
		it "should not save if an icon is not chosen"
		
		it "should not save if the icon is not one of the three set icons"
		
	 end #end invalid attributes
  end #end registration
end
