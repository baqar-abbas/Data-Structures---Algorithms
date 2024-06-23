// Stack implementation using Linked List in JavaScript

// Node class for creating a node of the linked list
class Node {
    constructor(data) {
        this.value = data;
        this.next = null;
    }
}

// Linked List class and methods for stack operations
class LinkedList {
    constructor() {
        this.head = null;
    }

    // Push function to insert elements in the stack
    addFirst(value) {
        const newNode = new Node(value);
        newNode.next = this.head;
        this.head = newNode;
    }

    // Pop function to remove elements from the stack
    removeFirst() {
        if (!this.head) return null;
        const value = this.head.value;
        this.head = this.head.next;
        return value;
    }

    // isEmpty function retuns true if the stack is empty
    isEmpty() {
        return this.head === null;
    }

    // display function to display the Element of the Linked List
    display() {
        if(this.isEmpty()) {
            console.log("Stack is Empty");
            return;
        }
        let current = this.head;
        console.log("Printing Stack Elements");
        while(current) {
            console.log(current.value);
            current = current.next;
        }
        
    }

    // Clear function to clear the memory immediately
    clear() {
     this.head = null;       
    }
}

// Stack class and methods
class Stack {
    constructor() {
        this.linkedList = new LinkedList();
    }

    // Push function which calls the function of the Linked List class
    push(value) {
        this.linkedList.addFirst(value);
        console.log("Item Pushed")
    }

    // Pop function which calls the function of the Linked List class
    pop() {
        const poppedValue = this.linkedList.removeFirst();
        if (poppedValue === null) {
            console.log("Stack Underflow");
        }
        else {
            console.log("Item Popped");
            return poppedValue;
        }
    }

    // show function which calls the display function of the linked List
    show() {
        this.linkedList.display();
    }

    // cleanup function which calls the clear function
    cleanup() {
        this.linkedList.clear();
        console.log("Memory cleaned up");
    }
}

const stack = new Stack();
let choice = 0;

console.log("\n*********Stack operations using linked list*********\n");
console.log("\n----------------------------------------------\n");

const prompt = require("prompt-sync")();

// Menu Driven program 
while(choice !== 4) {
    console.log("\n\nChoose one from the below options...\n");
    console.log("1.Push\n2.Pop\n3.Show\n4.Exit");

    choice = parseInt(prompt("Enter your choice: "), 10);
    
    switch(choice) {
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
            console.log("Exiting....");
            stack.cleanup();
            break;
        default:
            console.log("Please Enter a valid choice");
    }
}