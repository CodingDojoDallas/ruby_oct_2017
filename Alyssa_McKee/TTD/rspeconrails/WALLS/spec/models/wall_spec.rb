require 'rails_helper'

RSpec.describe Wall, type: :model do
	context 'with valid attributes' do
		it 'should save' do
			expect(build(:wall)).to be_valid
		end
	end
	context 'with invalid attributes' do
		it 'should not save if name is empty'
	
	end
end
