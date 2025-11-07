class Node {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

// Minimal BFS-only Binary Tree
class BinaryTree {
  constructor() {
    this.root = null;
  }

  // BFS Insert
  insert(value) {
    const newNode = new Node(value);
    if (!this.root) {
      this.root = newNode;
      return;
    }
    const queue = [this.root];

    while (queue.length) {
      const current = queue.shift();
      if (!current.left) {
        current.left = newNode;
        return;
      }
      if (!current.right) {
        current.right = newNode;
        return;
      }
      queue.push(current.left, current.right);
    }
  }

  // BFS Traversal
  traverse() {
    if (!this.root) return [];

    const result = [];
    const queue = [this.root];

    while (queue.length) {
      const current = queue.shift();
      result.push(current.value);

      if (current.left) queue.push(current.left);
      if (current.right) queue.push(current.right);
    }

    return result;
  }

  // NEW: Depth First Search Traversals

  // 1. DFS Pre-order Traversal: Root → Left → Right
  preOrder(node = this.root, result = []) {
    if (node) {
      result.push(node.value);
      this.preOrder(node.left, result);
      this.preOrder(node.right, result);
    }
    return result;
  }

  // 2. DFS In-order: Left → Root → Right
  inOrder(node = this.root, result = []) {
    if (node) {
      this.inOrder(node.left, result);
      result.push(node.value);
      this.inOrder(node.right, result);
    }
    return result;
  }

  // 3. DFS Post-order: Left → Right → Root
  postOrder(node = this.root, result = []) {
    if (node) {
      this.postOrder(node.left, result);
      this.postOrder(node.right, result);
      result.push(node.value);
    }
    return result;
  }

  // BFS Search (Level-order search)
  searchBFS(value) {
    if (!this.root) return false;

    const queue = [this.root];

    while (queue.length) {
      const current = queue.shift();
      if (current.value === value) return true;

      if (current.left) queue.push(current.left);
      if (current.right) queue.push(current.right);
    }
    return false;
  }

  // DFS Search (using recursion - pre order )
  searchDFS(value, node = this.root) {
    if (!node) return false;

    //check current node
    if (node.value === value) return true;

    // Recursively search left and right subtrees
    return (
      this.searchDFS(value, node.left) || this.searchDFS(value, node.right)
    );
  }

  // Find Node (returns the node instead of boolean)
  findNode(value, node = this.root) {
    if (!node) return null;

    if (node.value === value) return node;

    const leftResult = this.findNode(value, node.left);
    if (leftResult) return leftResult;

    return this.findNode(value, node.right);
  }
}

// Quick Demo
const binaryTree = new BinaryTree();
[10, 20, 30, 40, 50].forEach((val) => binaryTree.insert(val));

console.log("Tree Structure:");
console.log("      10");
console.log("     /  \\");
console.log("    20   30");
console.log("   / \\");
console.log("  40  50");

console.log("BFS Traversal:", binaryTree.traverse());
// Output: [10, 20, 30, 40, 50]
console.log("DFS Pre-order Traversal:", binaryTree.preOrder());
// Output: [10, 20, 40, 50, 30]
console.log("DFS In-order Traversal:", binaryTree.inOrder());
// Output: [40, 20, 50, 10, 30]
console.log("DFS Post-order Traversal:", binaryTree.postOrder());
// Output: [40, 50, 20, 30, 10]
// Test searches
console.log("=== SEARCH OPERATIONS ===");
console.log("BFS Search for 50:", binaryTree.searchBFS(50)); // true
console.log("BFS Search for 99:", binaryTree.searchBFS(99)); // false

console.log("DFS Search for 40:", binaryTree.searchDFS(40)); // true
console.log("DFS Search for 25:", binaryTree.searchDFS(25)); // false

console.log("Find Node 50:", binaryTree.findNode(50)?.value); // 50
console.log("Find Node 80:", binaryTree.findNode(80)); // null

/* OUTPUT of Binary Tree Data Structure and Traversals: 
Tree Structure:
      10
     /  \
    20   30
   / \
  40  50
BFS Traversal: [ 10, 20, 30, 40, 50 ]
DFS Pre-order Traversal: [ 10, 20, 40, 50, 30 ]
DFS In-order Traversal: [ 40, 20, 50, 10, 30 ]
DFS Post-order Traversal: [ 40, 50, 20, 30, 10 ]
=== SEARCH OPERATIONS ===
BFS Search for 50: true
BFS Search for 99: false
DFS Search for 40: true
DFS Search for 25: false
*/
