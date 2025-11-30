#  Challenge description
#  Binary Search Tree in Ruby

#  The Binary Search Tree is a a Binary Tree which stores keys in a sorted manner. Every node's key is smaller than all the key's in the node's left subtree and greater than all the key's in the nodes right subtree. Here's an example:

#  Inserting Elements in the Tree

#  Insertion and Search can usually be done very quickly in a binary Tree. The smallest and largest elements in the tree are easy to find. It's simple to go from one element to the next in the tree and to through the entire Tree in order.
#  Challenge

#  You will be given an array of numbers as input. Insert the numbers (in order) one-at-a-time into a binary search tree. Then return a string with the tree in pre-order (You can use the pre-order function that you wrote in the previous lesson).

#  binarySearchTree([8, 3, 10, 1, 6, 14, 4, 7, 13])
#  => "8 3 1 6 4 7 10 14 13"

class BSTNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil   # Smaller values
    @right = nil  # Larger values
  end

end

class BinarySearchTree
    attr_accessor :root

    def initialize
        @root = nil
    end

    # INSERT - Maintains BST property
    def insert(value)
        new_node = BSTNode.new(value)

        if @root.nil?
            @root = new_node
            return self
        end

        current = @root

        while true 
            return nil if value == current.value # No duplicates allowed

            if value < current.value
                # Go left 
                if current.left.nil?
                    current.left = new_node 
                    return self
                end
                current = current.left
            else 
                # Go right
                if current.right.nil?
                    current.right = new_node
                    return self
                end
                current = current.right
            end

        end
    end

    # Pre-order traversal: Root → Left → Right
    def pre_order(node = @root, result = [])
        if node
            result << node.value
            pre_order(node.left, result)
            pre_order(node.right, result)
        end
        result
    end
end

# Challenge function
def binary_search_tree(arr)
    bst = BinarySearchTree.new

     # Insert all elements in order
    arr.each do |value|
        bst.insert(value)
    end

     # Get pre-order traversal and convert to string

    pre_order_result = bst.pre_order
    pre_order_result.join(' ')
end

# Test the challenge
puts "=== BST CODING CHALLENGE IN RUBY ==="
result = binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
puts "Input: [8, 3, 10, 1, 6, 14, 4, 7, 13]"
puts "Output: #{result}"
puts "Expected: '8 3 1 6 4 7 10 14 13'"

# Step-by-step visualization
puts "\n=== TREE STRUCTURE ==="
puts "       8"
puts "      / \\"
puts "     3   10"
puts "    / \\    \\"
puts "   1   6    14"
puts "      / \\   /"
puts "     4   7 13"