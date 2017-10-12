class MathDojo
    attr_reader :result
    def initialize
        @result = 0
    end
    # 3, 5, 6, [1, 2, 3]
    def add(*nums)       
        p @result.class
        for num in nums
            if num.class == Array
                #loop through the array and sum the elements
                for x in num
                    @result += x.to_f
                end
            else
                @result += num.to_f# @result = @result + num
            end
        end
        self
    end
    def subtract(*nums)       
        p @result.class
        for num in nums
            if num.class == Array
                #loop through the array and sum the elements
                for x in num
                    @result -= x.to_f
                end
            else    
                @result -= num.to_f
            end
        end        
        self
    end        
  end
  challenge1 = MathDojo.new.add(2,2).add(2, 5).subtract(3, 2) # => 4
  challenge2 = MathDojo.new.add(1,1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3])
  p challenge1.result
  p challenge2.result
