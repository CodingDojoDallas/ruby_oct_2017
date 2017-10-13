class Tree
	attr_accessor :age
	attr_reader :height, :apple_count

	def initialize
		@age = 0
		@height = 10
		@apple_count = 0
	end

	def get_age
		@age
	end	

	def set_age(age)
		@age = age
		set_apple_count	
	end

	def get_apple_count
		@apple_count
	end

	def get_height
		@height
	end

	def year_gone_by
		@age += 1
		set_apple_count
		height = @height
		@height = height += height*0.1
		return @age
	end

	def pick_apples
		picked_apples = @apple_count
		@apple_count = 0
	end	

	def display
		puts "About this Tree"
		puts "Age: #{@age}"
		puts "Height: #{@height} ft" 
		puts "There are #{@apple_count} on this tree."
	end	

	private

	def set_apple_count
		if @age < 3 or @age > 10
			@apple_count = 0
		end	
		if @age > 3 and @age < 10
			@apple_count = @age * 2
		end		
	end
end