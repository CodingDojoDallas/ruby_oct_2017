require 'rails_helper'
feature 'authentication' do
  before do
    @user = create(:user)
  end
  feature "user sign-in" do
    scenario 'visits sign-in page' do
      visit '/login'
      expect(page).to have_field('email')
      expect(page).to have_field('password')
    end
    scenario 'logs in user if email/password combination is valid' do
      login
      expect(current_path).to eq("/users/#{@user.id}")
      expect(page).to have_text(@user.first_name)
    end
    scenario 'does not sign in user if email is not found' do
      login email: 'wrong email'
      expect(current_path).to eq("/login")
      expect(page).to have_text('Account not found, please register first.')
    end    
    scenario 'does not sign in user if email/password combination is invalid' do
      login password: 'wrong password'
      expect(current_path).to eq("/login")      
      expect(page).to have_text('Password is not correct.')
    end
  end
  feature "user to log out" do
    before do 
      login 
    end
    scenario 'displays "Log Out" button when user is logged on' do
      expect(page).to have_link('Logout')
    end
    scenario 'logs out user and redirects to login page' do
      click_link 'Logout'
      expect(current_path).to eq('/login')
    end
  end
end