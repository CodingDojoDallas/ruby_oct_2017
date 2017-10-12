# #Class
# class Vehicle
#     attr_accessor :engine

#     def initialize engine, weight, capacity
#         @engine = engine
#         @weight = weight
#         @capacity = capacity
#         @mileage = mileage
#     end
#     def turnOn
#        "Wruum" 
#     end    
#     def to_s
#         "Engine : #{@engine},Weight: #{@weight}, Capacity: #{@capacity}"
#     end        
# end

# #Object of Vehicle
#         #it is a memory address

def test 
    puts "You are in the method" 
    yield 
    puts "You are again back to the method" 
    yield 
  end 
  test { puts "You are in the block" }

  def test 
    yield 5 
    puts "You are in the method test" 
    yield 100 
  end 
  test { |i| puts "You are in the block #{i}" }