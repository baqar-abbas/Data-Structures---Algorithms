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
end

# Demo
tree = BinaryTree.new
[10, 20, 30, 40, 50].each { |x| tree.insert(x) }
puts tree.bfs.inspect  # [10, 20, 30, 40, 50]