class Fixnum
	def my_upto last
		(self..last).each{ |i| yield i }
	end
	
	def my_times
		(0...self).each{ yield }
	end
	
	def my_prev
		self-1
	end
	
	def my_next
		self+1
	end
	
end
