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

     # Function to delete the node at the head of the linked list
     def delete_at_head
       return if @head.nil?
       @head = @head.next
     end

     # Function to delete the node at a specific index in the linked list
     def delete_at_index(index)
       return if @head.nil?
       if index.zero?
        @head = @head.next
        return
       end
       current = @head
       prev = nil
       counter = 0
       while counter < index && !current.nil?
       prev = current
       current = current.next
       counter += 1
       end
       return if current.nil?
       prev.next = current.next
     end

     # Function to delete the node at the end of the linked list
     def delete_at_end
     return if @head.nil?
     if @head.next.nil?
        @head = nil
        return
     end
     current = @head
     prev = nil
     while current.next
        prev = current
        current = current.next
     end
     prev.next = nil
     end

     # Function to delete the node with a specific value in the linked list
     def delete_by_value(value)
       return if @head.nil?
       if @head.data == value
        @head = @head.next
        return
       end
       current = @head
       prev = nil
       while current.next && current.data != value
        prev = current
        current = current.next
       end
         return if current.nil?
         prev.next = current.next
     end

     # Function to traverse the linked list and print the elements
     def display
       current = @head
       while !current.nil?
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
puts "Original linked list:"
list.display

# Deleting the node at the head of the linked list - Uncomment the line below to test
# list.delete_at_head

# Deleting the node at a specific index in the linked list - Uncomment the line below to test
# list.delete_at_index(2)

# Deleting the node at the end of the linked list - Uncomment the line below to test
# list.delete_at_end

# Deleting the node with a specific value in the linked list 
list.delete_by_value(41)

# Displaying the elements of the linked list after deletion
puts "Linked list after deleting the node:"
list.display
