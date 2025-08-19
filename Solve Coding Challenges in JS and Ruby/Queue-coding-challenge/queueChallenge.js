// Challenge description
// Queue

// Create a Queue with the two methods add and remove.
// Use your LinkedList class to keep track of the elements internally.
//  In this challenge, there's one more detail: If remove is called
// on the empty Queue, return -1.
// Example

// This is an example of a test case:

// const queue = new Queue()
// queue.add(3)
// queue.add(5)
// console.log(queue.remove)
// // => 3

// queue.add(2)
// queue.add(7)
// console.log(queue.remove())
// // => 5

// console.log(queue.remove())
// // => 2

// console.log(queue.remove())
// // => 7

// console.log(queue.remove())
// // => -1

// The numbers come out in the order they went in, and the final remove returns a -1 since the queue is empty.

class Node {
  constructor(value, next_node = null) {
    this.data = value;
    this.next = next_node;
  }
}

class LinkedList {
  constructor() {
    this.head = null;
  }

  add(value) {
    const newNode = new Node(value);
    if (!this.head) {
      this.head = newNode;
    } else {
      let current = this.head;
      while (current.next) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  remove(index) {
    if (index !== 0) {
      console.log("Dequeue operation can only be perform at the front");
      return;
    } else {
      this.head = this.head ? this.head.next : null;
      return;
    }
  }
}

class Queue {
  constructor() {
    this.list = new LinkedList();
  }

  add(value) {
    this.list.add(value);
  }

  remove() {
    if (!this.list.head) {
      console.log("Queue is empty");
      return -1;
    }

    const removed = this.list.head.data;
    this.list.remove(0);
    return removed;
  }

  printQueue() {
    let current = this.list.head;
    let result = [];
    while (current) {
      result.push(current.data);
      current = current.next;
    }
    console.log(result.join(" <- "));
  }
}

const queue = new Queue();

queue.add(3);
queue.add(5);
queue.printQueue(); // => 3 <- 5
console.log("Dequeue:", queue.remove()); // => 3

queue.add(2);
queue.add(7);
queue.printQueue(); // => 5 <- 2 <- 7
console.log("Dequeue:", queue.remove()); // => 5

console.log("Dequeue:", queue.remove()); // => 2
console.log("Dequeue:", queue.remove()); // => 7
console.log("Dequeue:", queue.remove()); // => -1
