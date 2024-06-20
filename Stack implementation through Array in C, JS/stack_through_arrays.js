// Stack implementation using arrays in JavaScript

class Stack {
    constructor(size) {
      this.stack = new Array(size);
      this.top = -1;
      this.size = size;
    }
  
    // Push function to insert elements in the stack
    push(value) {
      if (this.top === this.size - 1) {
        console.log("Stack Overflow");
      } else {
        this.stack[++this.top] = value;
      }
    }
  
    // Pop function to remove elements from the stack
    pop() {
      if (this.top === -1) {
        console.log("Stack Underflow");
      } else {
        this.top--;
      }
    }
  
    // Show function to display elements in the stack
    show() {
      if (this.top === -1) {
        console.log("Stack is empty");
      } else {
        for (let i = this.top; i >= 0; i--) {
          console.log(this.stack[i]);
        }
      }
    }
  
    // Peek function to display the top element of the stack
    peek() {
      if (this.top === -1) {
        console.log("Stack Underflow");
        return null;
      } else {
        return this.stack[this.top];
      }
    }
  }
  
  // Main function to demonstrate stack operations
  function main() {
    const prompt = require('prompt-sync')({sigint: true});
    const n = parseInt(prompt("Enter the number of elements in the stack: "), 10);
    const stack = new Stack(n);
  
    console.log("*********Stack operations using array*********");
    console.log("----------------------------------------------");
  
    let choice = 0;
  
    while (choice !== 5) {
      console.log("\nChoose one from the below options...");
      console.log("1.Push\n2.Pop\n3.Show\n4.Peek\n5.Exit");
      choice = parseInt(prompt("Enter your choice: "), 10);
  
      switch (choice) {
        case 1:
          const value = parseInt(prompt("Enter the value: "), 10);
          stack.push(value);
          break;
        case 2:
          stack.pop();
          break;
        case 3:
          stack.show();
          break;
        case 4:
          console.log(stack.peek());
          break;
        case 5:
          console.log("Exiting....");
          break;
        default:
          console.log("Please Enter valid choice");
      }
    }
  }
  
  main();