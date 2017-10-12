# puts (1..255).to_a.join(' ')


# def create_array_of_odds_to(n)
#     Array.new((n + 1) / 2) {|i| 2 * i + 1}
#   end
  
#  puts create_array_of_odds_to 255


# class Array
#     def sum
#       inject { |sum, x| sum + x }
#     end
#   end

# [1..255].sum
# puts sum  
 
# array = [1, 2, 3, 4, 5, 6]
# array.each { |x| puts x }


# def max (a,b)
#     a>b ? a : b
#   end
# puts max

# [4, 5, 7, 10].minmax

# class Array
#     def sum
#       inject(0.0) { |result, el| result + el }
#     end
  
#     def mean 
#       sum / size
#     end
#   end

# class SizeMatters
#     include Comparable
#     attr :str
#     def <=>(anOther)
#       str.size <=> anOther.str.size
#     end
#     def initialize(str)
#       @str = str
#     end
#     def inspect
#       @str
#     end
#   end


# arr = [1, 3, 5, 7]
# y = 3
# puts arr.count { |elem| elem > y }
# # //////////

# arr = [1, 5, 10, -2]
# puts arr.map! { |elem| elem * elem }

# arr = [1, 5, 10, -2]
# puts arr.each_index { |index| arr[index] = 0 if arr[index] < 0 }

# arr = [1, 5, 10, -2]
# { max: arr.max, min: arr.min, average: arr.reduce(:+) / arr.length.to_f }



