require_relative 'mammal'
class Lion < Mammal
    def initialize()
        super
    end      
end
lion = Lion.new   
puts lion.display_health
puts "The Lion's health is #{lion.attack_town.attack_town.attack_town.eat_human.eat_human.eat_human.display_health}"
