# Implementation of Queue in Ruby

# class Node
class Node 
 attr_accessor :data, :next
    # Initialize a new node with data and next pointer
 def initialize(data)
   @data = data
   @next = nil
 end
end

# Queue Class
class Queue 

    def initialize 
        @front = nil
        @rear = nil
    end

#    Enqueue Operation
    def enqueue(value)
       new_node = Node.new(value)
       if @rear.nil?
        @front = @rear = new_node
       else 
        @rear.next = new_node
        @rear = new_node
       end
    end

    # Dequeue Operation
    def dequeue 
        if @front.nil?
            puts "Queue is empty"
            return nil
        end
        dequeued_value = @front.data
        @front = @front.next
        @front = @rear = nil if @front.nil? # If the queue becomes empty
        dequeued_value
    end
    # Peek Operation
    def peek 
    if @front.nil?
        puts "Queue is empty"
        return nil
    end
    @front.data
    end
    # is Empty Boolean
    def is_empty?
        @front.nil?
    end

    # Print queue elements
    def print_queue
        if @front.nil?
            puts "Queue is empty"
            return 
        end

        result = "Front -> "
        current = @front

        while current
            result += "[#{current.data}] -> "
            current = current.next
        end
        result += "nil"
        puts result
    end
end

# Queue Usage 

q = Queue.new

q.enqueue(10)
q.enqueue(20)
q.enqueue(30)
q.print_queue   # Front -> [10] -> [20] -> [30] -> nil

puts "Front element: #{q.peek}" # 10
puts "Dequeued: #{q.dequeue}"   # 10
q.print_queue   # Front -> [20] -> [30] -> nil

q.enqueue(40)
q.print_queue   # Front -> [20] -> [30] -> [40] -> nil

# OutPut:
# Front -> [10] -> [20] -> [30] -> nil
# Front element: 10
# Dequeued: 10
# Front -> [20] -> [30] -> nil
# Front -> [20] -> [30] -> [40] -> nil
