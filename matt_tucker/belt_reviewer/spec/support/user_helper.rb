require "rails_helper"

module CapybaraHelpers
  def register(first_name: 'Homer', last_name: "Simpson", email: "donuts@mmm.com", password: "password", password_confirmation: "password")
    visit new_user_path unless current_path == new_user_path
    fill_in "first_name", with: first_name
    fill_in "last_name", with: last_name
    fill_in "email", with: email
    fill_in "password", with: password
    fill_in "password_confirmation", with: password_confirmation
    click_button "Register"
  end

  def login(email: "donuts@mmm.com", password: "password")
    visit new_login_path unless current_path == new_login_path
    fill_in "email", with: email
    fill_in "password", with: password
    click_button "Login"
  end
end