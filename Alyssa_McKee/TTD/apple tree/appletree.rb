class AppleTree
	attr_accessor :age
	attr_reader :height, :apple_count
	def initialize age
		@age = age
		@height = 1
		@apple_count = 0
	end
	def year_gone_by
		@height += @height*0.1
		@apple_count += 2 if (4..10).include? @age
		@age = @age.next
		self
	end
	def pick_apples
		@apple_count = 0
	end
end