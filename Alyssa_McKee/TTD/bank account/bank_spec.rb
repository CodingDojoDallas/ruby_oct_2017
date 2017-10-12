require_relative 'bank'

RSpec.describe Bank do
	describe 'attributes' do
		before(:each) do
			@bank = Bank.new
		end
		it 'has a getter method for retrieving the checking account ballance' do
			@bank.depositToChecking 50
			expect(@bank.checking_balance).to eq(50)
		end
		it 'has a getter method to retrieves the total account balance' do
			@bank.depositToChecking 50
			@bank.depositToSavings 50
			expect(@bank.total_balance).to eq(100)
		end
		it 'has a method that allows the user to withdraw cash' do
			@bank.depositToChecking 50
			expect(@bank.withdraw 50).to eq(50) #????
		end
	end
	describe 'errors' do
		before(:each) do
			@bank = Bank.new
		end
		it 'Raises an error if a user tries to withdraw more money than they have in the account' do
			expect{@bank.withdraw 50}.to raise_error(OverdraftError)
		end
		it 'raises an error if the user attempts to retrieve the total number of bank accounts' do
			expect{@bank.total_accounts}.to raise_error(NoMethodError)
		end
		it 'Raises an error when the user attempts to set the interest rate' do
			expect{@bank.interest_rate = 0}.to raise_error(NoMethodError)
		end
	end

end