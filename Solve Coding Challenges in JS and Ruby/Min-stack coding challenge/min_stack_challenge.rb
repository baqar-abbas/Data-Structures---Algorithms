# Challenge description - Implement a Min Stack in Ruby
# Min Stack

# Create a Stack that contains the standard push and pop methods. It should also contain another method min that returns the minimum number in the Stack.
# Extra Credit

# All operations should take O(1) time.
# Example

# This is an example of a test case:

# const stack = new Stack()

# stack.push(3)
# stack.push(5)
# console.log(stack.min())
# // => 3

# stack.pop
# stack.push(7)
# console.log(stack.min())
# // => 3

# stack.push(2)
# console.log(stack.min())
# // => 2

# stack.pop
# console.log(stack.min())
# // => 3

class Stack 
  def initialize
    @stack = []
    @min_stack = []
  end

  def push(value)
    @stack.push(value)
    if @min_stack.empty? || value <= @min_stack.last
        @min_stack.push(value)
    end
  end

  def pop
    if @stack.empty?
        puts "Stack is empty"
        return nil

    end
    popped_value = @stack.pop
    @min_stack.pop if popped_value == @min_stack.last
    popped_value
  end

  def min
  if @min_stack.empty?
      puts "Stack is empty"
      return nil
  end
  @min_stack.last
  end

end

stack = Stack.new
puts "Pushing 3 on the stack"
stack.push(3)
puts "Current minimum: #{stack.min}"
puts "Pushing 5 on the stack"
stack.push(5)
puts "Current minimum: #{stack.min}"
puts "Popping from the stack: Popped #{stack.pop}"
puts "Current minimum: #{stack.min}"
puts "Pushing 7 on the stack"
stack.push(7)
puts "Current minimum: #{stack.min}"
puts "Pushing 2 on the stack"
stack.push(2)
puts "Current minimum: #{stack.min}"
puts "Popping from the stack: Popped #{stack.pop}"
puts "Current minimum: #{stack.min}"

# Output:

# Pushing 3 on the stack
# Current minimum: 3
# Pushing 5 on the stack
# Current minimum: 3
# Popping from the stack: Popped 5
# Current minimum: 3
# Pushing 7 on the stack
# Current minimum: 3
# Pushing 2 on the stack
# Current minimum: 2
# Popping from the stack: Popped 2
# Current minimum: 3
