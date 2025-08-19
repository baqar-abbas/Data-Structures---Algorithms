# Challenge description
# Queue

# Create a Queue with the two methods add and remove. 
# Use your LinkedList class to keep track of the elements internally.
# In this challenge, there's one more detail: If remove is called
# on the empty Queue, return -1.

# Example

# This is an example of a test case:

# const queue = new Queue()
# queue.add(3)
# queue.add(5)
# console.log(queue.remove)
# // => 3

# queue.add(2)
# queue.add(7)
# console.log(queue.remove())
# // => 5

# console.log(queue.remove())
# // => 2

# console.log(queue.remove())
# // => 7

# console.log(queue.remove())
# // => -1

# The numbers come out in the order they went in, and the final remove returns a -1 since the queue is empty.

class Node 
    attr_accessor :data, :next

    def initialize(value, next_node = nil)
        @data = value
        @next = next_node
    end
end

class LinkedList 
    attr_accessor :head

    def initialize
        @head = nil
    end

    def add(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else 
            current = @head
            current = current.next while current.next
            current.next = new_node
        end
    end

    def remove(index)
        if index != 0
            puts "Dequeue Operation only possible on the front of the Queue"
            return
        else 
            @head = @head? @head.next : nil
            return
        end
    end
end

class Queue

    def initialize
        @linked_list = LinkedList.new
    end

    def add(value)
     @linked_list.add(value)
    end

    def remove
        if @linked_list.head.nil?
            puts "Queue is empty"
            return -1
        else
            value = @linked_list.head.data
            @linked_list.remove(0)
            return value
        end
    end

    def print_queue
        current = @linked_list.head
        result = []
        while current
            result << current.data
            current = current.next
        end
        puts result.join(" <- ")
    end
end

# Example usage:
queue = Queue.new

queue.add(3)
queue.add(5)
queue.print_queue # => 3 <- 5
puts "Dequeue: #{queue.remove}" # => 3

queue.add(2)
queue.add(7)
queue.print_queue # => 5 <- 2 <- 7
puts "Dequeue: #{queue.remove}" # => 5

puts "Dequeue: #{queue.remove}" # => 2
puts "Dequeue: #{queue.remove}" # => 7
puts "Dequeue: #{queue.remove}" # => -1

# Output:

# 3 <- 5
# Dequeue: 3
# 5 <- 2 <- 7
# Dequeue: 5
# Dequeue: 2
# Dequeue: 7
# Queue is empty
# Dequeue: -1