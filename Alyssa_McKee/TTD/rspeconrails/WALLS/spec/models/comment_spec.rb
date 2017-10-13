require 'rails_helper'

RSpec.describe Comment, type: :model do
	context 'with valid attributes' do
		it 'should save' do
			expect(build(:comment)).to be_valid
		end
	end #valid
	context 'with invalid attributes' do
		it 'should not save if content is less than 11 characters'
		
		it 'should not save if user reference is missing'
		
	end #invalid  
end
