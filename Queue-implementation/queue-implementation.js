// Implementation of a Queue in JavaScript

// Node class
class Node {
  constructor(data) {
    this.data = data;
    this.next = null;
  }
}

// Queue class
class Queue {
  constructor() {
    this.front = null;
    this.rear = null;
  }

  // Enqueue operation
  enqueue(value) {
    const newNode = new Node(value);
    if (this.rear === null) {
      this.front = newNode;
      this.rear = newNode;
    } else {
      this.rear.next = newNode;
      this.rear = newNode;
    }
  }

  // Dequeue operation
  dequeue() {
    if (this.front === null) {
      console.log("Queue is empty");
      return null;
    }
    const value = this.front.data;
    this.front = this.front.next;
    if (this.front === null) {
      this.rear = null;
    }
    return value;
  }

  // Peek operation
  peek() {
    if (this.front === null) {
      console.log("Queue is empty");
      return null;
    }
    return this.front.data;
  }

  // Check if empty
  isEmpty() {
    return this.front === null;
  }

  // Print queue elements
  printQueue() {
    if (this.isEmpty()) {
      console.log("Queue is empty");
      return;
    }
    let result = "front -> ";
    let current = this.front;
    while (current) {
      result += `[${current.data}] -> `;
      current = current.next;
    }

    result += "NULL";
    console.log(result);
  }
}

//Queue Usage
const q = new Queue();
q.enqueue(10);
q.enqueue(20);
q.enqueue(30);
q.printQueue(); // Output: front -> [10] -> [20] -> [30] -> NULL

console.log("Front element:", q.peek()); // Output: Front element: 10
console.log("Dequeued element:", q.dequeue()); // Output: Dequeued element: 10
q.printQueue(); // Output: front -> [20] -> [30] -> NULL

q.enqueue(40);
q.printQueue(); // Output: front -> [20] -> [30] -> [40] -> NULL

// Output:
// front -> [10] -> [20] -> [30] -> NULL
// Front element: 10
// Dequeued element: 10
// front -> [20] -> [30] -> NULL
// front -> [20] -> [30] -> [40] -> NULL
