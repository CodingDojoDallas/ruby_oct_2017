class Project
  attr_accessor :name, :description, :owner, :tasks

  def initialize(name, description, owner)
  	@name = name
  	@description = description
    @owner = owner
    @tasks = []

  end

  def elevator_pitch
    "#{@name}, #{@description}"
  end
  
  def self.about
  	puts "this is a project"	
  end

  def tasks
    @tasks
  end  

  def add_tasks(task)
    @tasks << task
  end

  def print_tasks
    @tasks.each do |task|
      puts task
    end  
  end

end


lab = Project.new("lab", "diagnostic laboratory", "me")

lab.add_tasks('build a building')
lab.tasks

lab.add_tasks('call molly')
lab.add_tasks('call stan')

lab.print_tasks
