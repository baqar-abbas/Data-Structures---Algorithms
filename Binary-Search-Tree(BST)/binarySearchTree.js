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
