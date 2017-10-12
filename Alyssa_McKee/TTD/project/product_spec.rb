require_relative 'Project'
RSpec.describe Project do
	describe "attributes" do
		before(:each) do
			# updated this block to create two projects
			@project1 = Project.new('Project 1', 'description 1', 'john doe')
		end
		it 'has a getter and setter for name attribute' do
			@project1.name = "Changed Name" # this line would fail if our class did not have a setter method
			expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
		end 
		it 'has a getter and setter for owner attribute' do
			@project1.owner = "New Owner"
			expect(@project1.owner).to eq("New Owner")
		end
		it 'has a getter for the tasks attribute' do
			expect(@project1.tasks).to eq([])
		end
	end
	describe 'methods' do
		before(:each) do
			@project1 = Project.new('Project 1', 'description 1', 'john doe')
		end
		it 'has a method elevator_pitch to explain name and description' do
			@project1 = Project.new('Project 1', 'description 1', 'john doe')
			@project2 = Project.new('Project 2', 'description 2', 'john doe')
			expect(@project1.elevator_pitch).to eq("Project 1, description 1")
			expect(@project2.elevator_pitch).to eq("Project 2, description 2")
		end
		it 'has a method add_task to add tasks to instance variable tasks' do
			@project1.add_tasks("new task")
			expect(@project1.tasks).to eq(["new task"])
		end
		it 'has a method print_tasks to print the tasks to the console' do 
			@project1.add_tasks("new task")
			expect{@project1.print_tasks}.to output("new task\n").to_stdout
		end
	end
end