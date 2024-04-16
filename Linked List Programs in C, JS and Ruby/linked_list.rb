# Define a Node class to represent each node in the linked list

class Node

    attr_accessor :data, :next

    def initialize(data, next_node = nil)
    @data = data
    @next = next_node
    end

end

# Define a LinkedList class to represent the linked list

class LinkedList

    def initialize
        @head = nil
    end

    # Add a new node to the linked list
    def add(data)
    if @head.nil?
        @head = Node.new(data)
    else
        current = @head
        while current.next != nil
        current = current.next
        end
        current.next = Node.new(data)
    end
    end

     # Function to traverse the linked list and print the elements

    def display
       current = @head
       while current
        puts "Element: #{current.data}"
        current = current.next
       end 
    end

end

# Creating an instance of LinkedList
list = LinkedList.new

# Adding elements to the linked list
list.add(7)
list.add(11)
list.add(41)
list.add(66)

# Displaying the elements of the linked list
list.display