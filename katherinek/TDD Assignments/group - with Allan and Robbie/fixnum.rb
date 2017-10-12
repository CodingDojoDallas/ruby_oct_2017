class Fixnum
		
	def my_upto(a)
		(self..a).each {|i| yield (i)}
	end

	def my_times()
		(1..self).each { yield }
	end

	def my_prev
		self-1
	end

	def my_next
		self+1
	end	

end

# 5.my_prev

# 2.my_upto(6) do |i| 
# 	puts i 
# end