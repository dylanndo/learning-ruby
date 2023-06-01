def calculate(expression)
    operators = ["+", "-", "*", "/"]
    stack = []
    puts 1

    expression.split.each do |token|
        if operators.include? token
            num2 = stack.pop().to_f
            num1 = stack.pop().to_f
        #     operand2 = stack.pop
        #     operand1 = stack.pop
        #     stack.push(operand1.to_f.send(token, operand2.to_f))
        # else
        #     stack.push(token)
        # end
            case token
            when "+"
                result = num1 + num2
            when "-"
                result = num1 - num2
            when "*"
                result = num1 * num2
            when "/"
                result = num1 / num2
            end

            stack.push(result)
        
        elsif token == "("
            stack.push(token)

        elsif token == ")"
            operator = stack.pop()

            while operator != "("
                num2 = stack.pop().to_f
                num1 = stack.pop().to_f

                case operator
                when "+"
                    result = num1 + num2
                when "-"
                    result = num1 - num2
                when "*"
                    result = num1 * num2
                when "/"
                    result = num1 / num2
                end

                stack.push(result)
                operator = stack.pop()
            end
        
        else
            stack.push(token.to_f)
        end
    end
    stack.pop()
end

puts calculate("3 * ( 1 + 2 )")


puts "Enter a number: "
num1 = gets.chomp().to_f
puts "Enter an operator: "
op = gets.chomp()
puts "Enter a second number: "
num2 = gets.chomp().to_f

if op == "+"
    puts (num1 + num2)
elsif op == "-"
    puts (num1 - num2)
elsif op == "*"
    puts (num1 * num2)
elsif op == "/"
    puts (num1 / num2)
else
    puts "Invalid operator."
end