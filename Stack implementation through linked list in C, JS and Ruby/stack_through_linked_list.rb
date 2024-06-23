# Stack implementation using Linked List in Ruby

# Node class for creating a node
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

end

# Linked List class for creating a linked list

class LinkedList

    def initialize
        @head = nil
    end

    # Push function to insert elements in the stack
    def add_first(value)
        new_node = Node.new(value)
        new_node.next = @head
        @head = new_node
        puts "Item pushed: #{value}"
    end

     # Pop function to remove elements from the stack
     def remove_first
        return nil if @head.nil?
        value = @head.value
        @head = @head.next 
        value
     end

     # isEmpty function returns true if the stack is empty
     def empty?
        @head.nil?
     end

     # Display function to display the elements of the linked list
     def display
        if empty?
            puts "Stack is empty"
            return
        end
        current = @head
        while current != nil
            puts current.value
            current = current.next
        end
     end

      # Clear function to clear the memory immediately
  def clear
    @head = nil
  end

end

# Stack class for creating a stack
class Stack 

    def initialize
        @linked_list = LinkedList.new
    end

    # Push function which calls the function of the LinkedList class
    def push(value)
        @linked_list.add_first(value)
    end

    # Pop function which calls the function of the LinkedList class
    def pop
    popped_value = @linked_list.remove_first
    if popped_value.nil?
        puts "Stack Underflow"
    else
        puts "Item popped: #{popped_value}"
        popped_value
    end
end

  # Show function which calls the display function of the LinkedList
  def show
    @linked_list.display
  end

  # Cleanup function which calls the clear function
  def cleanup
    @linked_list.clear
    puts "Memory cleaned up"
  end

end

# Main function to run the program
def main 
    stack = Stack.new
    choice = 0

    # Display the menu
    puts "\n*********Stack operations using linked list*********\n"
    puts "\n----------------------------------------------\n"

    # menu-driven program
    while choice != 4
        puts "\n\nChoose one from the below options...\n"
        puts "1. Push"
        puts "2. Pop"
        puts "3. Show"
        puts "4. Exit"
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
            stack.cleanup
            puts "Exiting..."
        else
            puts "Invalid choice! Please enter a valid choice."
        end
    end

end

main()
