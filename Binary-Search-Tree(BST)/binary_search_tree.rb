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

    # DELETE Operation
    def delete(value)
        @root = delete_node(@root, value)
    end

    private

    def delete_node(node, value)
        return nil if node.nil?

         # Search for the node to delete
         if value < node.value
            node.left = delete_node(node.left, value)
         elsif value > node.value
            node.right = delete_node(node.right, value)
         else 
             # Node found! Handle the 3 cases:

             # Case 1: No children (Leaf Node)
             if node.left.nil? && node.right.nil?
                return nil
             end

              # Case 2: One child
              if node.left.nil?
                return node.right
              end
              if node.right.nil?
                return node.left
              end

            # Case 3: Two children
            # Find the inorder successor (smallest in the right subtree)
              successor = find_min(node.right)
              node.value = successor.value # Replace value
              node.right = delete_node(node.right, successor.value) # Delete successor  

         end
         node
    end

     # Helper: Find minimum value in a subtree
     def find_min(node)
        current = node
        current = current.left until current.left.nil?
        current
     end

      # Helper: Find maximum value in a subtree
    def find_max(node)
        current = node
        current = current.right until current.right.nil?
        current
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

# Test the BST delete operation
puts "=== BST DELETE Operation ==="

# Test Case 1: Delete leaf node (40)
bst1 = BinarySearchTree.new
[50, 30, 70, 20, 40, 60, 80].each { |v| bst1.insert(v)}

puts "Before deleting Leaf node 40: #{bst1.dfs_in_order}"
bst1.delete(40)
puts "After deleting Leaf node 40: #{bst1.dfs_in_order}"
puts "Expected: [20, 30, 50, 60, 70, 80]"

# Test Case 2: Delete node with one child (30)
bst2 = BinarySearchTree.new
[50, 30, 70, 20, 40, 60, 80].each { |val| bst2.insert(val)}
puts "\nBefore deleting 30: #{bst2.dfs_in_order}"
bst2.delete(30)
puts "After deleting 30: #{bst2.dfs_in_order}"
puts "Expected: [20, 40, 50, 60, 70, 80]"

# Test Case 3: Delete node with two children (root 50)
bst3 = BinarySearchTree.new
[50, 30, 70, 20, 40, 60, 80].each { |val| bst3.insert(val) }

puts "\nBefore deleting root 50: #{bst3.dfs_in_order}"

bst3.delete(50)
puts "After deleting root 50: #{bst3.dfs_in_order}"
puts "New root: #{bst3.root.value}" # Should be 60 (inorder successor)
puts "Expected: [20, 30, 40, 60, 70, 80]"

# Test Case 4: Delete non-existent value
bst4 = BinarySearchTree.new
[50, 30, 70].each { |val| bst4.insert(val) }

puts "\nBefore deleting 99: #{bst4.dfs_in_order}"
bst4.delete(99) # Should not change anything
puts "After trying to delete 99: #{bst4.dfs_in_order}"
puts "Expected: [30, 50, 70] (no change)"

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
=== BST DELETE Operation ===
Before deleting Leaf node 40: [20, 30, 40, 50, 60, 70, 80]
After deleting Leaf node 40: [20, 30, 50, 60, 70, 80]
Expected: [20, 30, 50, 60, 70, 80]

Before deleting 30: [20, 30, 40, 50, 60, 70, 80]
After deleting 30: [20, 40, 50, 60, 70, 80]
Expected: [20, 40, 50, 60, 70, 80]

Before deleting root 50: [20, 30, 40, 50, 60, 70, 80]
After deleting root 50: [20, 30, 40, 60, 70, 80]
New root: 60
Expected: [20, 30, 40, 60, 70, 80]

Before deleting 99: [30, 50, 70]
After trying to delete 99: [30, 50, 70]
Expected: [30, 50, 70] (no change)
=end