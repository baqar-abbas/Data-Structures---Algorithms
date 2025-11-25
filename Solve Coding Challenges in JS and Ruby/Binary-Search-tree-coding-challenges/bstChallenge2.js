// Challenge description
// Is it a Search Tree? in JavaScript

// Given a binary tree, can you determine if it is a proper Binary Search Tree?

// In a binary search tree, every descendant to the right of node P must be greater than P, and every descendant to the left of P must be less than P.

// The input will be given as a list, as in the previous exercises.

// Here's a good Binary Search Tree:

import good_tree from "./good_tree.png";

<img src={good_tree} alt="Good Binary Search Tree" />;

// ...and here's a bad one:

import bad_tree from "./bad_tree.png";
<img src={bad_tree} alt="Bad Binary Search Tree" />;

// This tree is not a proper BST for 2 reasons:

//     The 8 is smaller than the 9, even though it is in a right subtree of 9.
//     The 6 is smaller than the 7, even though it is in a right subtree of 7.

// Challenge

// Return true if the given tree is a proper binary search tree, and false otherwise.
// Example

// tree = [10, 4, 12]

// search_tree?(tree)
// # => true

function isBinarySearchTreeInOrder(treeArray) {
  function arrayToTree(arr, index = 0) {
    if (index >= arr.length || arr[index] === null) return null;

    return {
      value: arr[index],
      left: arrayToTree(arr, 2 * index + 1),
      right: arrayToTree(arr, 2 * index + 2),
    };
  }

  function inOrderTraversal(node, result = []) {
    if (node) {
      inOrderTraversal(node.left, result);
      result.push(node.value);
      inOrderTraversal(node.right, result);
    }
    return result;
  }

  const root = arrayToTree(treeArray);
  const sorted = inOrderTraversal(root);

  // Check if in-order traversal is strictly increasing
  for (let i = 1; i < sorted.length; i++) {
    if (sorted[i] <= sorted[i - 1]) return false;
  }
  return true;
}

console.log("\n=== In-order APPROACH  ===");
console.log("Test [10, 4, 12]:", isBinarySearchTreeInOrder([10, 4, 12])); // true
console.log(
  "Test Bad BST:",
  isBinarySearchTreeInOrder([9, 7, 12, 5, 8, 6, 13])
); // false
