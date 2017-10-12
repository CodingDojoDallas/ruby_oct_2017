class Mammal
    
    def initialize()
       @health = 170
    end    
    def display_health()
       @health
    end
    def fly ()
        @health -= 10
        self
    end    
    def attack_town()
        @health -= 50
        self
    end
    def eat_human()
        @health += 20
        self
    end        

end

