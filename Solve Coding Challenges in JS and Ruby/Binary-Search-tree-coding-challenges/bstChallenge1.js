// Challenge description
// Binary Search Tree in JavaScript

// The Binary Search Tree is a a Binary Tree which stores keys in a sorted manner. Every node's key is smaller than all the key's in the node's left subtree and greater than all the key's in the nodes right subtree. Here's an example:

// Inserting Elements in the Tree

// Insertion and Search can usually be done very quickly in a binary Tree. The smallest and largest elements in the tree are easy to find. It's simple to go from one element to the next in the tree and to through the entire Tree in order.
// Challenge

// You will be given an array of numbers as input. Insert the numbers (in order) one-at-a-time into a binary search tree. Then return a string with the tree in pre-order (You can use the pre-order function that you wrote in the previous lesson).

// binarySearchTree([8, 3, 10, 1, 6, 14, 4, 7, 13])
// // => "8 3 1 6 4 7 10 14 13"

class BSTNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

class BinarySearchTree {
  constructor() {
    this.root = null;
  }

  // Insert method
  insert(value) {
    const newNode = new BSTNode(value);

    if (!this.root) {
      this.root = newNode;
      return this;
    }

    let current = this.root;

    while (true) {
      if (value === current.value) return undefined; // No duplicates allowed

      if (value < current.value) {
        // Go Left
        if (!current.left) {
          current.left = newNode;
          return this;
        }
        current = current.left;
      } else {
        // Go Right
        if (!current.right) {
          current.right = newNode;
          return this;
        }
        current = current.right;
      }
    }
  }

  // Pre-order traversal: Root → Left → Right
  preOrder(node = this.root, result = []) {
    if (node) {
      result.push(node.value);
      this.preOrder(node.left, result);
      this.preOrder(node.right, result);
    }
    // return result.join(" ");
    return result;
  }
}

// Challenge function
function binarySearchTree(arr) {
  const bst = new BinarySearchTree();

  // Insert all elements in order
  arr.forEach((value) => bst.insert(value));

  // Get pre-order traversal and convert to string
  const preOrderResult = bst.preOrder();
  return preOrderResult.join(" ");
}

// Test the challenge
console.log("=== BST CODING CHALLENGE ===");
const result = binarySearchTree([8, 3, 10, 1, 6, 14, 4, 7, 13]);
console.log("Input: [8, 3, 10, 1, 6, 14, 4, 7, 13]");
console.log("Output:", result);
console.log("Expected: '8 3 1 6 4 7 10 14 13'");

// Step-by-step visualization
console.log("\n=== TREE STRUCTURE ===");
console.log("       8");
console.log("      / \\");
console.log("     3   10");
console.log("    / \\    \\");
console.log("   1   6    14");
console.log("      / \\   /");
console.log("     4   7 13");
