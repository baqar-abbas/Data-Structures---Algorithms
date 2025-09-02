// Challenge description
// Min Stack

// Create a Stack that contains the standard push and pop methods. It should also contain another method min that returns the minimum number in the Stack.
// Extra Credit

// All operations should take O(1) time.
// Example

// This is an example of a test case:

// const stack = new Stack()

// stack.push(3)
// stack.push(5)
// console.log(stack.min())
// // => 3

// stack.pop
// stack.push(7)
// console.log(stack.min())
// // => 3

// stack.push(2)
// console.log(stack.min())
// // => 2

// stack.pop
// console.log(stack.min())
// // => 3

class Stack {
  constructor() {
    this.stack = [];
    this.minStack = [];
  }

  push(value) {
    this.stack.push(value);
    if (
      this.minStack.length === 0 ||
      value <= this.minStack[this.minStack.length - 1]
    ) {
      this.minStack.push(value);
    }
  }

  pop() {
    if (this.stack.length === 0) {
      console.log("Stack is empty");
      return undefined;
    }
    const poppedValue = this.stack.pop();
    if (poppedValue === this.minStack[this.minStack.length - 1]) {
      this.minStack.pop();
    }
    return poppedValue;
  }

  min() {
    if (this.minStack.length === 0) {
      console.log("Stack is empty");
      return undefined;
    }
    return this.minStack[this.minStack.length - 1];
  }
}

const stack = new Stack();
console.log("Pushing 3 onto the stack");
stack.push(3);
console.log("Pushing 5 onto the stack");
stack.push(5);
console.log("Min Stack value:", stack.min());
// => 3

console.log("Popping from the stack");
console.log("Popped value:", stack.pop());
console.log("Pushing 7 onto the stack");
stack.push(7);
console.log("Min Stack value:", stack.min());
// => 3

console.log("Pushing 2 onto the stack");
stack.push(2);
console.log("Min Stack value:", stack.min());
// => 2

console.log("Popping from the stack");
console.log("Popped value:", stack.pop());
console.log("Min Stack value:", stack.min());
// => 3

// Output:

// Pushing 3 onto the stack
// Pushing 5 onto the stack
// Min Stack value: 3
// Popping from the stack
// Popped value: 5
// Pushing 7 onto the stack
// Min Stack value: 3
// Pushing 2 onto the stack
// Min Stack value: 2
// Popping from the stack
// Popped value: 2
// Min Stack value: 3
