# sample mad lib from https://kidscodecs.com/python-mad-libs/#:~:text=AN%20EXAMPLE%20MADLIB&text=It%20was%20pizza%20day%20at,and%20ran%20through%20the%20playground.

puts "Enter a food: "
food = gets.chomp().upcase()
puts "Enter a girl's name: "
name = gets.chomp().upcase()
puts "Enter an adjective: "
adjective = gets.chomp().upcase()
puts "Enter a noun: "
noun = gets.chomp().upcase()
puts "Enter a verb: "
verb1 = gets.chomp().upcase()
puts "Enter another verb: "
verb2 = gets.chomp().upcase()
puts "Enter another verb: "
verb3 = gets.chomp().upcase()

puts ("It was " + food + " day at school, and " + name + " was super " + adjective + " for lunch.")
puts ("But when she went outside to eat, a " + noun + " stole her " + food + "! ")
puts (name + " chased the " + noun + " all over school.")
puts ("She " + verb1 + ", " + verb2 + ", and " + verb3 + " through the playground.")
puts ("Then she tripped on her " + noun + " and the " + noun + " escaped!")
puts ("Luckily, " + name + "'s friends were willing to share their " + food + " with her.")