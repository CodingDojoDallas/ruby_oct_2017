class Project
	attr_accessor :name, :description, :owner
	def initialize name, description, owner
		@name = name
		@description = description
		@owner = owner
		@tasks = []
	end
	def elevator_pitch
		"#{@name}, #{@description}"
	end
	def tasks
		@tasks
	end
	def add_tasks task
		@tasks << task
	end
	def print_tasks
		puts @tasks
	end
end

p = Project.new('Project 1', 'description 1', 'john doe')

p p.print_tasks == p.tasks

