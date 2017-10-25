require "rails_helper"
module CapybaraHelpers
	def login(email: "Deku@almightfanclub.com", password: "password")
		visit login_path unless current_path == login_path
		fill_in "session[email]", with: email
		fill_in "session[password]", with: password
		click_button "Login"
	end
end