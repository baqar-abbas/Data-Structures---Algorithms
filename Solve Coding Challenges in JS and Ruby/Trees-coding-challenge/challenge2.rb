#   Challenge description - Tree Traversal in Ruby

#   Creating a Tree

#   The previous challenge showed how to store a Tree in an Array. But how do you convert a Tree from an Array to the more-standard Node form?
#   Implementing a Tree

#   To implement a Tree, we'll create a Node class. It will store an integer of Data, and point to 2 child Nodes.

#   class Node {
#     constructor(data) {
#       this.data = data
#       this.left = null
#       this.right = null
#     }
#   }

#       Create a Node node from a given cell i in the array: Node node = new Node(array[i]);
#       Create the children Nodes from their positions in the array. (See step #1).
#       Assign the children Nodes to node.left and node.right.

#   You first create a Node, and then you create children Nodes in the same manner. This sounds like a recursive function will be needed!

#   As mentioned, since trees are recursive structures, recursive functions are used to navigate them.

#   Here's the above algorithm:

#   function arrayToTree(array, i) {
#     if (i >= array.length || array[i] === 0) {
#       return null
#     }

#     const node = new Node(array[i])
#     node.left = arrayToTree(array, 2*i+1)
#     node.right = arrayToTree(array, 2*i+2)

#     return node
#   }

#   Traversing a Tree in Pre-order

#   Pre-order traversal means you process a Node and then process its sub-trees.

#   Here is the pre-order algorithm:

#   function preOrder(node) {
#     if (node === null) {
#       return '';
#     }

#     return `${node.data} ${preOrder(node.left)} ${preOrder(node.right)}`
#   }

#   Challenge

#   You will be given an array as input, which represents a Tree. Process the array into a Tree of Nodes, as shown above. Then go through the tree and print it in post-order. Print each number space-separated.
#   Example test case

#   const = tree = arrayToTree([10, 1, 2, 3, 4, 5, 6])

#   console.log(postOrder(tree))
#    => 3 4 1 5 6 2 10

#   Tree Structure:

#          10
#         /  \
#        1    2
#       / \   / \
#      3   4 5   6

class Node 
attr_accessor :data, :left, :right

def initialize(data)
  @data = data
  @left = nil
  @right = nil
end

end

# Convert array to tree
def array_to_tree(array, i = 0)
  return nil if i >= array.length || array[i] == 0
  
  node = Node.new(array[i])
  node.left = array_to_tree(array, 2 * i + 1)
  node.right = array_to_tree(array, 2 * i + 2)
  
  node
end

# Post-order traversal: Left → Right → Root
def post_order(node)
  return '' if node.nil?

   left = post_order(node.left)
  right = post_order(node.right)

   result = []
  result << left unless left.empty?
  result << right unless right.empty?
  result << node.data.to_s
  
  result.join(' ').strip
end

# Test case from challenge
tree = array_to_tree([10, 1, 2, 3, 4, 5, 6])
puts post_order(tree)
# Output: 3 4 1 5 6 2 10