require 'rails_helper'
feature 'authentication' do
  before do
    @user = create(:user)
  end
  feature "user sign-in" do
    scenario 'visits sign-in page' do
      visit '/sessions/new'
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end
    scenario 'logs in user if email/password combination is valid' do
      login
      expect(current_path).to eq("/users/#{@user.id}")
      expect(page).to have_text(@user.name)
    end
    scenario 'does not sign in user if email is not found' do
      login email: 'wrong email'
      expect(current_path).to eq("/sessions/new")
      expect(page).to have_text('Email not found')
    end    
    scenario 'does not sign in user if email/password combination is invalid' do
      login password: 'wrong password'
      expect(current_path).to eq("/sessions/new")      
      expect(page).to have_text('Password does not match')
    end
  end
  feature "user to log out" do
    before do 
      login 
    end
    scenario 'displays "Log Out" button when user is logged on' do
      expect(page).to have_button('Logout')
    end
    scenario 'logs out user and redirects to login page' do
      click_button 'Logout'
      expect(current_path).to eq('/sessions/new')
    end
  end
end