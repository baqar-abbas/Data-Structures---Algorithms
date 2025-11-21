// Binary Search Tree (BST) implementation in JavaScript

class BSTNode {
  constructor(value) {
    this.value = value;
    this.left = null; // Smaller values
    this.right = null; // Larger values
  }
}

class BinarySearchTree {
  constructor() {
    this.root = null;
  }

  // INSERT - Maintains BST property
  insert(value) {
    const newNode = new BSTNode(value);

    if (!this.root) {
      this.root = newNode;
      return this;
    }

    let current = this.root;

    while (true) {
      if (value === current.value) return undefined; // No duplicates

      if (value < current.value) {
        // Go LEFT
        if (!current.left) {
          current.left = newNode;
          return this;
        }
        current = current.left;
      } else {
        // Go RIGHT
        if (!current.right) {
          current.right = newNode;
          return this;
        }
        current = current.right;
      }
    }
  }

  // SEARCH - O(log n) complexity on average
  search(value) {
    if (!this.root) return false;

    let current = this.root;

    while (current) {
      if (value === current.value) return true;

      if (value < current.value) {
        current = current.left; // Go Left
      } else {
        current = current.right; // Go Right
      }
    }
    return false;
  }

  // DFS Traversals (same as binary tree but now ordered!)

  // In-order: Left → Root → Right (Returns SORTED values!)
  dfsInOrder(node = this.root, results = []) {
    if (node) {
      this.dfsInOrder(node.left, results);
      results.push(node.value);
      this.dfsInOrder(node.right, results);
    }
    return results;
  }

  // DELETE Operation
  delete(value) {
    this.root = this._deleteNode(this.root, value);
  }

  _deleteNode(node, value) {
    if (!node) return null;

    // Search for the node to delete
    if (value < node.value) {
      node.left = this._deleteNode(node.left, value);
    } else if (value > node.value) {
      node.right = this._deleteNode(node.right, value);
    } else {
      // Node found! Handle the 3 cases:

      // Case 1: No children (Leaf Node)
      if (!node.left && !node.right) {
        return null;
      }

      // Case 2: One child
      if (!node.left) return node.right;
      if (!node.right) return node.left;

      // Case 3: Two children
      // Find the inorder successor (smallest in the right subtree)
      const successor = this._findMin(node.right);
      node.value = successor.value; // Replace value
      node.right = this._deleteNode(node.right, successor.value); // Delete successor
    }

    return node;
  }

  // Helper: Find minimum value in a subtree
  _findMin(node) {
    while (node.left) {
      node = node.left;
    }
    return node;
  }

  // Helper: Find maximum value in a subtree
  _findMax(node) {
    while (node && node.right) {
      node = node.right;
    }
    return node;
  }
}

// Create BST
const bst = new BinarySearchTree();

console.log("=== BST INSERT Operation ===");
// Insert values
bst.insert(50);
bst.insert(30);
bst.insert(70);
bst.insert(20);
bst.insert(40);
bst.insert(60);
bst.insert(80);

console.log("BST Structure:");
console.log("       50");
console.log("      /  \\");
console.log("     30   70");
console.log("    / \\   / \\");
console.log("   20 40 60 80");

// Test Search - The Magic of BST! is O(log n)
console.log("\n=== BST SEARCH DEMO ===");
console.log("Search for 40:", bst.search(40)); // true - Path: 50 → 30 → 40
console.log("Search for 65:", bst.search(65)); // false - Path: 50 → 70 → 60 → NULL
console.log("Search for 80:", bst.search(80)); // true - Path: 50 → 70 → 80

// Depth First Search In-order traversal returns SORTED values!
console.log("\n=== BST DFS IN-ORDER TRAVERSAL ===");
console.log("In-order Traversal (Sorted):", bst.dfsInOrder()); // [20, 30, 40, 50, 60, 70, 80]

// Case 1: Delete leaf (40)
bst.delete(40);
console.log("\nAfter deleting leaf 40:");
console.log("In-order:", bst.dfsInOrder());

// Case 2: Delete node with one child (20)
// First reset tree
const bst2 = new BinarySearchTree();
[50, 30, 70, 20, 40, 60, 80].forEach((v) => bst2.insert(v));
console.log("New BST2 Tree", bst2.dfsInOrder());
bst2.delete(30);
console.log("\nAfter deleting 30");
console.log("In-order:", bst2.dfsInOrder());

// Case 3: Delete node with two children (root 50)
const bst3 = new BinarySearchTree();
[50, 30, 70, 20, 40, 60, 80].forEach((val) => bst3.insert(val));
bst3.delete(50);
console.log("\nAfter deleting root 50 (two children):");
console.log("In-order:", bst3.dfsInOrder());
console.log("New root:", bst3.root.value); // Should be 60 (inorder successor)

// Output:
/* 
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
In-order Traversal (Sorted): [
  20, 30, 40, 50,
  60, 70, 80
]
*/
