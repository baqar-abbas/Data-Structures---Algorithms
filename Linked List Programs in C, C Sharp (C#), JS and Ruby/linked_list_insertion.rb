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
        while current.next
        current = current.next
        end
        current.next = Node.new(data)
    end
    end

    # Add a new node at the head of the linked list
    def insert_at_head(data)
        new_node = Node.new(data)
        new_node.next = @head
        @head = new_node
    end

    # Add a new node at a specific index in the linked list
    def insert_at_index(data, index)
        return insert_at_head(data) if index == 0
        new_node = Node.new(data)
        current = @head
        (index - 1).times do
        current = current.next
        end
        new_node.next = current.next
        current.next = new_node
    end

    # Add a new node at the end of the linked list
    def insert_at_end(data)
        add(data)
    end

    # Add a new node after a specific node in the linked list
    def insert_after_node(prev_node, data)
        return if prev_node.nil?
        new_node = Node.new(data)
        new_node.next = prev_node.next
        prev_node.next = new_node
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
puts 'Initial linked list:'
list.display

# Inserting a new node at the head of the linked list
list.insert_at_head(3)

# Displaying the elements of the linked list after insertion
puts 'Linked list after inserting at the head:'
list.display

# Inserting a new node at a specific index in the linked list
list.insert_at_index(56, 2)

# Displaying the elements of the linked list after insertion
puts 'Linked list after inserting at index 2:'
list.display

# Inserting a new node at the end of the linked list
list.insert_at_end(99)

# Displaying the elements of the linked list after insertion
puts 'Linked list after inserting at the end:'
list.display

# Inserting a new node after a specific node in the linked list
third_node = list.instance_variable_get(:@head).next.next
list.insert_after_node(third_node, 77)

# Displaying the elements of the linked list after insertion
puts 'Linked list after inserting after the third node:'
list.display