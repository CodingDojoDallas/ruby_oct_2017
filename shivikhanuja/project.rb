class Project
    @@project = 0
    def initialize(name,description)
        @name = name
        @description = description
        @@project += 1
        puts "Created a #{@@project}"
    end  
    def name
        @name
    end     
    def elevator_pitch
        puts "Project Name:#{@name}"
        puts "Project Description: #{@description}" 
        puts "Created #{@@project}"  
    end    
  end
  project1 = Project.new("Project 1", "Description 1")
  project2 = Project.new("Project 2", "Description 2")
  puts project1.name # => "Project 1"
  project1.elevator_pitch