require_relative 'bankaccount'
RSpec.describe BankAccount do

	before(:each) do
		@charlie = BankAccount.new("Charlie")
		@percy = BankAccount.new("Percy")
		#These are named for my cats. Because the internet needs more cats.
	end

	it 'has a get method to retrieve the checking account balance' do
		expect(@charlie.checking_balance).to eq(0)
	end	

	it 'has a get method to retrieve the saving account balance' do
		expect(@charlie.saving_balance).to eq(0)
	end	

	it 'has a method to deposit money into the checking account' do
		@charlie.deposit(50, "checking")
		expect(@charlie.checking_balance).to eq(50)
	end	

	it 'has a method to deposit money into the saving account' do
		@charlie.deposit(50, "saving")
		expect(@charlie.saving_balance).to eq(50)
	end	

	it 'has a method to retrieve the total balance of both accounts' do
		@charlie.deposit(50, "saving")
		@charlie.deposit(50, "checking")
		expect(@charlie.total).to eq(100)
	end	

	it 'has a method that allows users to withdraw cash' do
		@charlie.deposit(50, "checking")
		@charlie.withdraw(25, "checking")
		expect(@charlie.checking_balance).to eq(25)
	end	

	it 'raises an error if user attempts to overdraw' do
		@charlie.deposit(10, "checking")
		expect(@charlie.withdraw(25, "checking")).to eq("Insufficient Funds")
	end

	it 'raises an error if user attempts to retrieve count of all accounts' do
		expect{@charlie.count}.to raise_error(NoMethodError)
	end

	it 'raises an error if user attempts to set the interest rate' do
		expect{@charlie.interest_rate = 1}.to raise_error(NoMethodError)
	end
		
end
