# Implementtion of Stack through Arrays in Ruby

class Stack 
   
    def initialize(size)
        @stack = Array.new(size)
        @top = -1
        @size = size
    end

    # Push function to insert elements in the stack
    def push(value)
        if @top == @size - 1
            puts "Stack Overflow"
        else
            @top += 1
            @stack[@top] = value
        end
    end

    # Pop function to remove elements from the stack
    def pop 
        if @top == - 1
            puts "Stack Underflow"
        else 
            @top -= 1
        end
    end

    # Show function to display elements in the stack
    def show
        if @top == -1
            puts "Stack is Empty"
        else
            @top.downto(0) { |i| puts @stack[i] }
        end
    end

    # Peek function to display the top element of the stack
    def peek
    if @top == -1
        puts "Stack is Empty"
        nil
    else
        puts @stack[@top]
    end
    end

end

# Main function to demonstrate stack operations
def main
print "Enter the number of elements in the stack: "
size = gets.chomp.to_i
stack = Stack.new(size)

puts "*********Stack operations using array*********"
puts "----------------------------------------------"

choice = 0

# This program provides a menu-driven interface to perform stack operations.
while choice != 5
    puts "\nChoose one from the below options..."
    puts "1. Push"
    puts "2. Pop"
    puts "3. Show"
    puts "4. Peek"
    puts "5. Exit"
    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
        print "Enter the value: "
        value = gets.chomp.to_i
        stack.push(value)
    when 2
        stack.pop
    when 3
        stack.show
    when 4
        puts stack.peek
    when 5
        puts "Exiting..."
    else 
        puts "Invalid choice! Please Enter a valid choice..."
    end
end

end

main()