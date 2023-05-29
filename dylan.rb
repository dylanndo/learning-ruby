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

# working with numbers
puts 5
puts -5.5
puts 5 % 9
puts 2**3
num = 20
puts ("My favorite number is " + num.to_s)
num = -20.687
puts num.abs()
puts num.round()    # rounds to nearest integer
num = 20.1
puts num.ceil()    # rounds up to nearest integer
puts num.floor()    # rounds down to nearest integer
puts Math.sqrt(36)
puts Math.log(1)

# getting user input
puts "Enter your name: "
name = gets.chomp()
puts "Enter your age: "
age = gets.chomp()
puts ("Hello " + name + ", you are " + age + " years old and a roadie intern.")