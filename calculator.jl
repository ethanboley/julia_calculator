
import Base

# Functions demonstration
function add(a, b)
    return a + b
end

function subtract(a, b)
    return a - b
end

function multiply(a, b)
    return a * b
end

function divide(a, b)
    if b == 0
        println("Error: Division by zero")
        return
    end
    return a / b
end

# multiple dispatch demonstration

struct Square
    length::Float64
  end
  
struct Triangle
  length::Float64
  width::Float64
end

function calculate_area(square::Square)
    return square.length ^ 2
  end
  
function calculate_area(triangle::Triangle)
  return triangle.length * triangle.width / 2
end


# Main calculator loop

while true
    println("Options:")
    println("Enter 'add' for addition")
    println("Enter 'subtract' for subtraction")
    println("Enter 'multiply' for multiplication")
    println("Enter 'divide' for division")
    println("Enter 'area' to calculate such")
    println("Enter 'exit' to end the program")

    user_input = readline()

    if user_input == "exit"
        break
    end

    if !(user_input in ["add", "subtract", "multiply", "divide", "area"])
        println("Invalid input. Please try again.")
        continue
    end

    if !(user_input in ["area"])

        println("Enter the first number:")
        num1 = parse(Float64, readline())
        println("Enter the second number:")
        num2 = parse(Float64, readline())

        if user_input == "add"
            result = add(num1, num2)
        elseif user_input == "subtract"
            result = subtract(num1, num2)
        elseif user_input == "multiply"
            result = multiply(num1, num2)
        elseif user_input == "divide"
            result = divide(num1, num2)
        end

        println("Result: $result")
        println("")
    else
        println("Shape? ")
        println("Square or Triangle")
        
        user_shape = readline()
        
        if user_input == "exit"
            break
        end

        if user_shape in ["square", "Square", "s", "S", "1"]
            println("Enter the side length")
            square = Square(parse(Float64, readline()))
            area = calculate_area(square)
            println("Result: $area square units")
            println("")
        elseif user_shape in ["Triangle", "triangle", "t", "T", "2"]
            println("Enter the base length")
            width = parse(Float64, readline())
            println("Enter the triangle height")
            triangle = Triangle(width, parse(Float64, readline()))
            area = calculate_area(triangle)
            println("Result: $area square units")
            println("")
        end
    end
end
