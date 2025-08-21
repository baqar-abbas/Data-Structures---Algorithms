# Program to implement Recursion in Ruby

def factorial(n)
if n == 0
    return 1
else 
    return n * factorial(n-1)
end
end

puts "Enter a number: "
input = gets.chomp  # take raw input

# Check if input is a valid integer (regex ensures only digits allowed)
if input.match?((/\A\d+\z/))
   num = input.to_i
   
   result = factorial(num)
   puts "Factorial of number #{num} is #{result}"
else
    puts "Enter a valid Non negative integer value"
end



