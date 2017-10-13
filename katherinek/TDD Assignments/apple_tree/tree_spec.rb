require_relative 'tree'

RSpec.describe Tree do

	before(:each) do
		@tree = Tree.new
	end	

	it 'has a getter and setter for age attribute' do
		@tree.set_age(2)
		expect(@tree.age).to eq(2)
	end
	
	it 'has a getter method for height' do
		expect(@tree.height).to eq(10)
	end
	
	it 'raises an error if a user tries to alter height directly' do
		expect{@tree.height=2}.to raise_error(NoMethodError)
	end

	it 'has a getter method for apple count' do
		@tree.set_age(5)
		expect(@tree.get_apple_count).to eq(10)
	end

	it 'raises an error if a user tried to alter apple count directly' do
		expect{@tree.set_apple_count(3)}.to raise_error(NoMethodError)
	end

	it 'has a method year_gone_by which adds 1 year to age' do
		@tree.set_age(5)
		@tree.year_gone_by
		expect(@tree.get_age).to eq(6)
	end
	
	it 'has a method year_gone_by which increases height by 10%' do
		@tree.set_age(10)
		@tree.year_gone_by
		expect(@tree.get_height).to eq(11)
	end

	it 'has a method year_gone_by which increases apple count by 2' do
		@tree.set_age(5)
		@tree.year_gone_by
		expect(@tree.get_apple_count).to eq(12)
	end

	it 'has a method pick_apples which removes all apples from the tree' do
		@tree.set_age(5)
		expect(@tree.get_apple_count).to eq(10)
		@tree.pick_apples
		expect(@tree.get_apple_count).to eq(0)
	end

	context 'tree is under three years old' do
		it 'has a rule that trees under 3 years old have no apples' do
			@tree.set_age(2)
			expect(@tree.get_apple_count).to eq(0)
		end
	end

	context 'tree is over ten years old' do
		it 'has a rule that trees over 10 years old have no apples' do
			@tree.set_age(12)
			expect(@tree.get_apple_count).to eq(0)
		end
	end
end	