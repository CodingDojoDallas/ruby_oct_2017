# class Project
#     # your code here
#     attr_accessor :name, :description
#     def initialize(name, description) 
#         @name = name 
#         @description = description
#     end
#     def elevator_pitch
#         puts "This is the pitch method."
#         puts "#{@name}, #{@description}" 
#     end
#     # def name
#     #     @name
#     # end
# end
# # project1 = Project.new("Project 1", "Description 1")
# # puts project1.name # => "Project 1"
# # project1.elevator_pitch  # => "Project 1, Description 1"
  

class Project
    attr_accessor :name, :description, :owner, :tasks
    def initialize name, description
      @name = name
      @description = description
      @owner = ""
      @tasks = []
    end
    def elevator_pitch
      "#{@name}, #{@description}"
    end
    def tasks
        # @tasks.each do |task|
        #     puts task
        # end
        @tasks
    end
    def add_tasks val
        @tasks.insert(-1, val)
    end
    def print_tasks
        @tasks.each do |i|
            puts i
        end
    end
end