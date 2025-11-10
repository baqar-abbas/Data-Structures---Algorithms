class Node
  attr_accessor :val, :left, :right
  
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class BinaryTree
  def initialize
    @root = nil
  end
  
  def insert(val)
    node = Node.new(val)
    return @root = node if @root.nil?
    
    queue = [@root]
    until queue.empty?
      curr = queue.shift
      return curr.left = node if curr.left.nil?
      return curr.right = node if curr.right.nil?
      queue << curr.left << curr.right
    end
  end
  
  # BFS Traversal
  def bfs
    return [] if @root.nil?
    result, queue = [], [@root]
    until queue.empty?
      curr = queue.shift
      result << curr.val
      queue << curr.left if curr.left
      queue << curr.right if curr.right
    end
    result
  end

  # DFS Traversals

   # 1. DFS Pre-order: Root → Left → Right
   def pre_order(node = @root, result = [])
   if node 
    result << node.val
    pre_order(node.left, result)
    pre_order(node.right, result)
    
   end
   result
   end

    # 2. DFS In-order: Left → Root → Right
    def in_order(node = @root, result = [])
    if node
    in_order(node.left, result)
    result << node.val
    in_order(node.right, result)
    end
    result
    end

    # 3. DFS Post-order: Left → Right → Root
    def post_order(node = @root, result = [])
    if node 
    post_order(node.left, result)
    post_order(node.right, result)
    result << node.val
    end
    result
    end

     # SEARCH OPERATIONS

     # 1. BFS Search (Level-order search)
     def search_bfs(value)
      return false if @root.nil?

      queue = [@root]

      until queue.empty?
        current = queue.shift

        # Check if current node matches
        return true if current.val == value

        # Add children to queue
        queue << current.left if current.left
        queue << current.right if current.right
      end
      false
    end

     # 2. DFS Search (using recursion - pre order)
     def search_dfs(value, node = @root)
    return false if node.nil?
    
    # Check current node
    return true if node.val == value
    
    # Recursively search left and right subtrees
    search_dfs(value, node.left) || search_dfs(value, node.right)
  end

     # 3. Find Node (returns the node instead of boolean)
 def find_node(value, node = @root)
    return nil if node.nil?
    
    return node if node.val == value
    
    # Search left subtree first
    left_result = find_node(value, node.left)
    return left_result if left_result
    
    # Then search right subtree
    find_node(value, node.right)
  end

  # 4. Search with Path (returns the path to the node)
  def search_with_path(value, node = @root, path = [])
    return nil if node.nil?
    
    # Add current node to path
    path = path + [node.val]
    
    return path if node.val == value
    
    # Search left subtree
    left_path = search_with_path(value, node.left, path)
    return left_path if left_path
    
    # Search right subtree  
    right_path = search_with_path(value, node.right, path)
    return right_path if right_path
    
    nil # Not found in either subtree
  end

end

# Demo
tree = BinaryTree.new
[10, 20, 30, 40, 50].each { |x| tree.insert(x) }

puts "Tree Structure:"
puts "      10"
puts "     /  \\"
puts "    20   30"
puts "   / \\"
puts "  40  50"
puts

puts "BFS Traversal: #{tree.bfs.inspect}"
puts "DFS Pre-order: #{tree.pre_order.inspect}"
puts "DFS In-order: #{tree.in_order.inspect}"
puts "DFS Post-order: #{tree.post_order.inspect}"

# Test searches
puts "\n=== SEARCH OPERATIONS ==="
puts "BFS Search for 50: #{tree.search_bfs(50)}" # true
puts "BFS Search for 99: #{tree.search_bfs(99)}" # false

puts "DFS Search for 40: #{tree.search_dfs(40)}" # true  
puts "DFS Search for 25: #{tree.search_dfs(25)}" # false

puts "Find Node 50: #{tree.find_node(50)&.val}" # 50
puts "Find Node 80: #{tree.find_node(80)}" # nil

puts "Path to 50: #{tree.search_with_path(50)}" # [10, 20, 50]
puts "Path to 30: #{tree.search_with_path(30)}" # [10, 30]
puts "Path to 25: #{tree.search_with_path(25)}" # nil

=begin
Tree Structure:
      10
     /  \
    20   30
   / \
  40  50

BFS Traversal: [10, 20, 30, 40, 50]
DFS Pre-order: [10, 20, 40, 50, 30]
DFS In-order: [40, 20, 50, 10, 30]
DFS Post-order: [40, 50, 20, 30, 10]
=== SEARCH OPERATIONS ===
BFS Search for 50: true
BFS Search for 99: false
DFS Search for 40: true
DFS Search for 25: false
Find Node 50: 50
Find Node 80:
Path to 50: [10, 20, 50]
Path to 30: [10, 30]
Path to 25:
=end

