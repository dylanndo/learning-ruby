# Difference between puts and print:
# puts adds a new line after executing
# print does not add a new line after executing

print "Hello World"
print "lol"
puts "Roadie lit"
puts "i'm a roadie intern"

# drawing basic shapes
puts "   /|"
puts "  / |"
puts " /  |"
puts "/___|"

# variables + data types
name = "Dylan"
age = 20

puts ("My name is " + name + ".")
puts ("I am " + age.to_s + " years old.")
puts ("In one year, I will be " + (age + 1).to_s + " years old.")

# working with strings
phrase = "   Dylan is a roadie intern   "
puts phrase.upcase()
puts phrase.downcase()
puts phrase.strip()
puts phrase.length()
puts phrase.include? "intern"
puts phrase[5,9]
puts phrase.index("D")

