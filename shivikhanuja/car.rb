require_relative "vehicle"
# vehicle = Vehicle.new 'gas', 1000
# p vehicle


class Car < Vehical
    attr
    @@count = 0
    def count 
        @@count
    end    

    def initialize engine, weight, capacity, wheels, style
        @wheels = wheels
        @style = style
        @@count += 1
    end    
    def addMileage *miles
        miles.each{ |i| @mileage += i}
    end
    
    def to_s
        "#{super}, Wheels: #{@wheels}, Style: #{@style}"


end        
car = Car.new 'gas', 3000, 4, 4, 'sedan'
# car.engine = 'propane'
# car.weight = 2800
# car.addMileage = 50, 70, 200, 66


puts car.count