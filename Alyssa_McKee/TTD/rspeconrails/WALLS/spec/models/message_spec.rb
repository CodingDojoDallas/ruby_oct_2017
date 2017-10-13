require 'rails_helper'

RSpec.describe Message, type: :model do
  context "creation" do
		context "with valid attributes" do
			it "should save"
			
			
			
		end #end valid
		context "with invalid attributes" do
			it "it should not save if messege is empty"
			
			it "should not save if it is less than 10 characters"
			
			it "should not save if the user reference is missing"
			
			it "should not save if wall reference is missing"
			
		end #end invalid
  end #end with creation
end
