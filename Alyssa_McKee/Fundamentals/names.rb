a = {first_name: "Michael", last_name: "Choi"}
b = {first_name: "John", last_name: "Doe"}
c = {first_name: "Jane", last_name: "Doe"}
d = {first_name: "James", last_name: "Smith"}
e = {first_name: "Jennifer", last_name: "Smith"}
names = [a, b, c, d, e]

def print_names names
	puts "You have #{names.count} names in the 'names' array"
	names.each{|name| puts "The name is '#{name[:first_name]} #{name[:last_name]}' " }	
end

print_names names