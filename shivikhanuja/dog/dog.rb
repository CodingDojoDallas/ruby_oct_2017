require_relative 'mammal'
class Dog < Mammal
    def initialize()
        super
    end      
end
dog = Dog.new   
puts dog.display_health
puts dog.pet.display_health
puts dog.walk.display_health
puts dog.run.display_health
puts dog.walk.walk.walk.run.run.pet.display_health

