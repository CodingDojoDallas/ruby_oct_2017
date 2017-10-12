class BankAccount
	@@count = 0
	@interest_rate = 0.01
	@user
	@account_no
	@checking_balance
	@saving_balance

	attr_reader :user, :account_no, :checking_balance, :saving_balance

	def user
		p @user
		self
	end 
			
	def account_no
		p @account_no.join("")
		self
	end
	
	def checking_balance
		@checking_balance	
	end
	
	def saving_balance
		@saving_balance
	end
	
	def deposit(amt, acct)
		@checking_balance += amt if acct == "checking" 
		@saving_balance += amt if acct == "saving"
	end

	def withdraw(amt, acct)
		if acct == "checking"
			if @checking_balance > amt
				@checking_balance -= amt 
			else return "Insufficient Funds"	
			end
		end	
		if acct == "saving"
			if @saving_balance > amt
				@saving_balance -= amt
			else return "Insufficient Funds"
			end
		end	
	end

	def total
		@checking_balance + @saving_balance
	end

	def account_information
		puts "User name: #{@user}" 
		puts "Account No.: #{@account_no.join("")}"
		puts "Checking Balance: #{@checking_balance}"
		puts "Saving Balance: #{@saving_balance}"
		self
	end	

	private
		def initialize(user)
			@@count += 1
			@user = user
			@account_no = []
			8.times {@account_no.push(rand(0..9))}
			@checking_balance = 0
			@saving_balance = 0
		end	

		def count
			@@count
		end		
end	

