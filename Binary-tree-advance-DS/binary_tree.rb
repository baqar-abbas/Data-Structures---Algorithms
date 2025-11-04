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