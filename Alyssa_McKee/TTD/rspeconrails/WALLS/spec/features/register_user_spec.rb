require 'rails_helper'
feature "guest user create an account" do
	
	scenario "sucessfully create a new user account" do
		visit landing_path
		fill_in "user[username]", with: "Deku"
		check 'Maria Icon'
		click_button 'register'
		expect(page).to have_content "Welcome to the wall"
	end
	
	scenario "sucessfully login" #???
	
end #feature create account
