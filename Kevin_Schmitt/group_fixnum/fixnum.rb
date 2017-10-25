class Fixnum
    attr_accessor :name, :description, :owner, :output, :i
    def initialize name, description
        @name = name
        @description = description
        @owner = owner
        @output = []
    end
    def my_upto (num)
        yield(num)
        #loop from fixnum to num
        #apply the block, passing in the number
    end
    def my_times
 
    end
    def my_prev
    end
    def my_next
    end
end