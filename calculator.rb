def add(num1, num2)
    return num1 + num2
end
def subtract(num1, num2)
    return num1 - num2
end
def multiply(num1, num2)
    return num1 * num2
end
def divide(num1, num2)
    return num1 / num2
end
def power(num1, num2)
    return num1 ** num2
end

# account for exponents
def exponent(expression)
    expressions = ["+", "-", "*", "/", "(", ")"]
    while expression.index("^") != nil
        exponent_index = expression.index("^")
        i = exponent_index - 1
        num1 = nil
        prev_operator_index = nil
        # find first operand
        while i >= 0
            if expressions.include? expression[i]
                num1 = expression[i + 1...exponent_index].to_f
                prev_operator_index = i
                break
            end
            i -= 1
        end

        if num1 == nil
            num1 = expression[0...exponent_index].to_f
        end

        if prev_operator_index == nil
            prev_operator_index = -1
        end

        i = exponent_index + 1
        num2 = nil
        next_operator_index = nil
        # find second operand
        while i < expression.length()
            if expressions.include? expression[i]
                num2 = expression[exponent_index + 1...i].to_f
                next_operator_index = i
                break
            end
            i += 1
        end

        if num2 == nil
            num2 = expression[exponent_index + 1..-1].to_f
        end

        if next_operator_index == nil
            next_operator_index = expression.length()
        end

        # perform operation
        result = power(num1, num2)

        # replace expression with result
        expression = expression[0...prev_operator_index + 1] + result.to_s + expression[next_operator_index..-1]
    end
    return expression
end

# account for multiplication and division
def multiply_divide(expression)
    expressions = ["+", "-", "*", "/", "(", ")"]
    
    while expression.index("*") != nil or expression.index("/") != nil
        multiply_index = expression.index("*")
        divide_index = expression.index("/")
        multiply_divide_index = nil

        # find first operator
        if multiply_index == nil && divide_index == nil
            break
        elsif multiply_index == nil && divide_index >= 0
            multiply_divide_index = divide_index
        elsif multiply_index >= 0 && divide_index == nil
            multiply_divide_index = multiply_index
        elsif divide_index == nil && multiply_index >= 0
            multiply_divide_index = multiply_index
        else
            multiply_divide_index = [multiply_index, divide_index].min
        end
        
        i = multiply_divide_index - 1
        num1 = nil
        prev_operator_index = nil
        # find first operand
        while i >= 0
            if expressions.include? expression[i]
                num1 = expression[i + 1...multiply_divide_index].to_f
                prev_operator_index = i
                break
            end
            i -= 1
        end

        if num1 == nil
            num1 = expression[0...multiply_divide_index].to_f
        end

        if prev_operator_index == nil
            prev_operator_index = -1
        end
        
        i = multiply_divide_index + 1
        num2 = nil
        next_operator_index = nil
        # find second operand
        while i < expression.length()
            if expressions.include? expression[i]
                num2 = expression[multiply_divide_index + 1...i].to_f
                next_operator_index = i
                break
            end
            i += 1
        end

        if num2 == nil
            num2 = expression[multiply_divide_index + 1..-1].to_f
        end

        if next_operator_index == nil
            next_operator_index = expression.length()
        end

        # perform operation
        case expression[multiply_divide_index]
        when "*"
            result = multiply(num1, num2)
        when "/"
            result = divide(num1, num2)
        end

        expression = expression[0...prev_operator_index + 1] + result.to_s + expression[next_operator_index..-1]
    end
    return expression
end

# account for addition and subtraction
def add_subtract(expression)
    expressions = ["+", "-", "*", "/", "(", ")"]
    while expression.index("+") != nil or expression.index("-") != nil
        add_index = expression.index("+")
        subtract_index = expression.index("-")
        
        # find first operator
        if add_index == nil && subtract_index == nil
            break
        elsif add_index == nil && subtract_index >= 0
            add_subtract_index = subtract_index
        elsif subtract_index == nil && add_index >= 0
            add_subtract_index = add_index
        else
            add_subtract_index = [add_index, subtract_index].min
        end
        
        i = add_subtract_index - 1
        num1 = nil
        prev_operator_index = nil
        # find first operand
        while i >= 0
            if expressions.include? expression[i]
                num1 = expression[i + 1...add_subtract_index].to_f
                prev_operator_index = i
                break
            end
            i -= 1
        end

        if num1 == nil
            num1 = expression[0...add_subtract_index].to_f
        end

        if prev_operator_index == nil
            prev_operator_index = -1
        end
        
        i = add_subtract_index + 1
        num2 = nil
        next_operator_index = nil
        # find second operand
        while i < expression.length()
            if expressions.include? expression[i]
                num2 = expression[add_subtract_index + 1...i].to_f
                next_operator_index = i
                break
            end
            i += 1
        end

        if num2 == nil
            num2 = expression[add_subtract_index + 1..-1].to_f
        end

        if next_operator_index == nil
            next_operator_index = expression.length()
        end

        # perform operation
        case expression[add_subtract_index]
        when "+"
            result = add(num1.to_f, num2.to_f)
        when "-"
            result = subtract(num1, num2)
        end

        expression = expression[0...prev_operator_index + 1] + result.to_s + expression[next_operator_index..-1]
    end

    return expression
end

def calculate(expression)
    expressions = ["+", "-", "*", "/", "(", ")"]
    expression = "(" + expression.lstrip.rstrip + ")"

    # account for grouping first
    while expression.rindex("(") != nil
        finish = expression.index(")")
        start = expression.rindex("(", finish)
        grouped_expression = expression[start + 1...finish].lstrip.rstrip

        grouped_expression = exponent(grouped_expression)
        grouped_expression = multiply_divide(grouped_expression)
        grouped_expression = add_subtract(grouped_expression)

        expression = expression[0...start] + grouped_expression + expression[finish + 1..-1]
    end

    return expression
end

user_input = ""

while user_input.downcase != "exit"
    puts "Enter an expression to calculate or type 'exit' to quit"
    user_input = gets.chomp
    if user_input.downcase != "exit"
        puts calculate(user_input)
    end
end