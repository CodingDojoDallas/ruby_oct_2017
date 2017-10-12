class Bank
	attr_reader :account_number, :checking_balance, :saving_balance
	@interest_rate
	@@acounts = 0
	
	def initialize
		set_account_number
		@checking_balance = 0
		@saving_balance = 0
		@interest_rate = 0.01
		@@acounts += 1
	end
	
	def depositToSavings amount
		@saving_balance += amount
	end
	
	def depositToChecking amount
		@checking_balance += amount
	end
	
	def transferToSavings amount
		raise OverdraftError.new("tried to transfer $#{amount} from $#{@checking_balance} in checking. Transfer amount is greater than the balance in checking") if amount > @checking_balance
		@checking_balance -= amount
		@saving_balance += amount
		return "transaction complete"
	end
	
	def transferToChecking amount
		raise OverdraftError.new("tried to transfer $#{amount} from $#{@saving_balance} in savings. Transfer amount is greater than the balance in savings") if amount > @saving_balance
		@saving_balance -= amount
		@checking_balance += amount
		return "transaction complete"
	end
	
	def withdraw amount
		#return [false, "error insuficient funds"] if amount > @checking_balance
		raise OverdraftError.new("tried to withdraw $#{amount} from $#{@checking_balance} in checking. Withdraw amount is greater than the balance in checking") if amount > @checking_balance
		@checking_balance -= amount
		return amount
	end
	def total_balance
		@checking_balance + @saving_balance
	end
	
	def account_information
		"Account ##{@account_number}\nTotal Balance: $#{total_balance}\nChecking Account Balance: $#{@checking_balance}\nSavings Account Balance: $#{@saving_balance}\nInterest rate: #{@interest_rate*100}%\n"
	end
	
	private
		def set_account_number
			@account_number = rand(100...1000)
		end
end
class OverdraftError < StandardError
	def initialize message
		super()
	end
end