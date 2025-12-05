# Challenge description
# Is it a Search Tree? in JavaScript

# Given a binary tree, can you determine if it is a proper Binary Search Tree?

# In a binary search tree, every descendant to the right of node P must be greater than P, and every descendant to the left of P must be less than P.

# The input will be given as a list, as in the previous exercises.

# Here's a good Binary Search Tree:

# ...and here's a bad one:

# This tree is not a proper BST for 2 reasons:

#     The 8 is smaller than the 9, even though it is in a right subtree of 9.
#     The 6 is smaller than the 7, even though it is in a right subtree of 7.

# Challenge

# Return true if the given tree is a proper binary search tree, and false otherwise.
# Example

# tree = [10, 4, 12]

# search_tree?(tree)
#  => true

def search_tree?(tree_array)
  # Convert array to tree structure
  def array_to_tree(arr, index = 0)
    return nil if index >= arr.length || arr[index].nil?
    
    {
      value: arr[index],
      left: array_to_tree(arr, 2 * index + 1),
      right: array_to_tree(arr, 2 * index + 2)
    }
  end
  
  # In-order traversal
  def in_order_traversal(node, result = [])
    if node
      in_order_traversal(node[:left], result)
      result << node[:value]
      in_order_traversal(node[:right], result)
    end
    result
  end
  
  root = array_to_tree(tree_array)
  sorted = in_order_traversal(root)
  
  # Check if in-order traversal is strictly increasing
  (1...sorted.length).each do |i|
    return false if sorted[i] <= sorted[i - 1]
  end
  true
end

# Alternative approach with range checking (more efficient)
def search_tree_range?(tree_array)
  def array_to_tree(arr, index = 0)
    return nil if index >= arr.length || arr[index].nil?
    
    {
      value: arr[index],
      left: array_to_tree(arr, 2 * index + 1),
      right: array_to_tree(arr, 2 * index + 2)
    }
  end
  
  def valid_bst?(node, min = -Float::INFINITY, max = Float::INFINITY)
    return true unless node
    
    # Check current node value against min/max boundaries
    return false if node[:value] <= min || node[:value] >= max
    
    # Recursively check left and right subtrees with updated boundaries
    valid_bst?(node[:left], min, node[:value]) && 
    valid_bst?(node[:right], node[:value], max)
  end
  
  root = array_to_tree(tree_array)
  valid_bst?(root)
end

# Test the challenge
puts "=== BST VALIDATION CHALLENGE IN RUBY ==="

# Good BST examples
puts "Test 1 - [10, 4, 12]: #{search_tree?([10, 4, 12])}" # true
puts "Test 2 - [8, 3, 10, 1, 6, nil, 14]: #{search_tree?([8, 3, 10, 1, 6, nil, 14])}" # true

# Bad BST examples (from the description)
puts "Test 3 - Bad BST [9, 7, 12, 5, 8, 6, 13]: #{search_tree?([9, 7, 12, 5, 8, 6, 13])}" # false

# More test cases
puts "Test 4 - Single node [5]: #{search_tree?([5])}" # true
puts "Test 5 - Empty tree []: #{search_tree?([])}" # true
puts "Test 6 - [5, 1, 4]: #{search_tree?([5, 1, 4])}" # false (4 should be > 5)
puts "Test 7 - [2, 1, 3]: #{search_tree?([2, 1, 3])}" # true

# Test the range checking approach
puts "\n=== RANGE CHECKING APPROACH ==="
puts "Test [10, 4, 12]: #{search_tree_range?([10, 4, 12])}" # true
puts "Test Bad BST: #{search_tree_range?([9, 7, 12, 5, 8, 6, 13])}" # false

# Visualize the bad tree
puts "\n=== VISUALIZING THE BAD TREE ==="
bad_tree = [9, 7, 12, 5, 8, 6, 13]
puts "Array representation: #{bad_tree}"
puts "Tree structure:"
puts "        9"
puts "       / \\"
puts "      7   12"
puts "     / \\  / \\"
puts "    5  8 6  13"
puts "\nWhy it's invalid:"
puts "- 6 is in right subtree of 12 but 6 < 12 X"
puts "- BST property violated!"