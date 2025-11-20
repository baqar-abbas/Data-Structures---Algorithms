# Binary Search Tree (BST) implementation in Ruby

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

    # Insert a value into the BST
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

    # Check if a value exists in the BST
    def search(value)
        return false if @root.nil?

        current = @root

        while current
            return true if value == current.value

            if value < current.value
                current = current.left # Go Left
            else 
                current = current.right # Go Right
            end
        end
        false
    end

     # DFS Traversals (same as binary tree but now ordered!)

  # In-order: Left → Root → Right (Returns SORTED values!)

    def dfs_in_order(node = @root, results = [])
        if node 
            dfs_in_order(node.left, results)
            results << node.value
            dfs_in_order(node.right, results)
        end

        results
    end

end


# Program to test the Binary Search Tree implementation
puts "=== BST INSERT Operation ==="
bst = BinarySearchTree.new

# Insert values
bst.insert(50)
bst.insert(30)
bst.insert(70)
bst.insert(20)
bst.insert(40)
bst.insert(60)
bst.insert(80)

puts "BST Structure:"
puts "       50"
puts "      /  \\"
puts "     30   70"
puts "    / \\   / \\"
puts "   20 40 60 80"

# Test Search - The Magic of BST! O(log n)
puts "\n=== BST SEARCH DEMO ==="
puts "Search for 40: #{bst.search(40)}" # true - Path: 50 → 30 → 40
puts "Search for 65: #{bst.search(65)}" # false - Path: 50 → 70 → 60 → NULL
puts "Search for 80: #{bst.search(80)}" # true - Path: 50 → 70 → 80

# Depth First Search In-order traversal returns SORTED values!
puts "\n=== BST DFS IN-ORDER TRAVERSAL ==="
puts "In-order Traversal (Sorted): #{bst.dfs_in_order}" # [20, 30, 40, 50, 60, 70, 80]

# Final Output:

=begin
=== BST INSERT Operation ===
BST Structure:
       50
      /  \
     30   70
    / \   / \
   20 40 60 80

=== BST SEARCH DEMO ===
Search for 40: true
Search for 65: false
Search for 80: true

=== BST DFS IN-ORDER TRAVERSAL ===
In-order Traversal (Sorted): [20, 30, 40, 50, 60, 70, 80]
=end