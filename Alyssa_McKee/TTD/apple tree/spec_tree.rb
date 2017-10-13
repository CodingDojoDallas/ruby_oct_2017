require_relative "appletree"

RSpec.describe AppleTree do
	describe "attributes" do 
		before(:each) do
			@tree = AppleTree.new 5
		end
		it 'has an age attribute with a getter and setter' do
			@tree.age = 7
			expect(@tree.age).to eq(7)	
		end
		it 'has a height attribute with a getter method' do
			expect(@tree.height).to eq(1)
		end
		it 'raises a NoMethodError someone tries to set the height' do
			expect{@tree.height = 5}.to raise_error(NoMethodError)
		end
		it 'has an apple count attribute with a getter method' do
			expect(@tree.apple_count).to eq(0)
		end
		it 'raises a NoMethodError when someone tries to set the apple count' do
			expect{@tree.apple_count = 5}.to raise_error(NoMethodError)
		end	
	end
	before(:each) do
		@tree = AppleTree.new 5
	end
	describe 'methods' do
		before(:each) do
			@tree.year_gone_by
		end
		describe 'has a method called year_gone_by that' do
			it 'adds one year to the age' do
				expect(@tree.age).to eq(6)
			end
			it 'Increases the height by 10% of its current height' do
				expect(@tree.height).to eq(1.1)
			end
			it 'raises the apple count by two' do #but only if its older than 3????
				expect(@tree.apple_count).to eq(2)
			end
		end	
		it 'has a method called pick_apples that takes all of the apples off of the tree' do
			@tree.pick_apples
			expect(@tree.apple_count).to eq(0)
		end
		describe 'has stages where' do
			it 'it does not grow apples for the first 3 years of its life' do
				@tree1 = AppleTree.new 1
				expect(@tree1.apple_count).to eq(0)
				@tree1.year_gone_by #year 2
				expect(@tree1.apple_count).to eq(0)
				@tree1.year_gone_by #year 3
				expect(@tree1.apple_count).to eq(0)
			end
			it 'it does not grow apples if it is older than 10' do
				@tree11 = AppleTree.new 10
				@tree11.year_gone_by
				original_count = @tree11.apple_count
				@tree11.year_gone_by
				expect(@tree11.apple_count).to eq(original_count)
			end
		end
	end
end