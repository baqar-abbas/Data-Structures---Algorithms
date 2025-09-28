class Node {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

// Minimal BFS-only Binary Tree
class SimpleBFSTree {
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
}

// Quick Demo
const simpleTree = new SimpleBFSTree();
[10, 20, 30, 40, 50].forEach((val) => simpleTree.insert(val));

console.log("BFS Traversal:", simpleTree.traverse());
// Output: [10, 20, 30, 40, 50]
