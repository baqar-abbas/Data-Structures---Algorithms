// Program to implement Data Structure Linked List insertion operations in JavaScript
/* Description: This file contains the code to insert a new node at the head, 
at a specific index, at the end, and after a specific node in a linked list. */

// Define a Node class to represent each node in the linked list
class Node {
    constructor(data, next = null) {
        this.data = data;
        this.next = next;
    }
}

// Define a LinkedList class to represent the linked list
class LinkedList {
    constructor() {
        this.head = null;
    }

    // Add a new node to the linked list
    add(data) {
        const newNode = new Node(data);
        if(!this.head) {
            this.head = newNode;
        }
        else {
            let current = this.head;
            while(current.next) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    // Add a new node at the head of the linked list
    insertAtHead(data) {
        let newNode = new Node(data);
        newNode.next = this.head;
        this.head = newNode;
    }

    // Add a new node at a specific index in the linked list
    insertAtIndex(data, index) {
        if(index === 0) {
            this.insertAtHead(data);
            return;
        }
        let newNode = new Node(data);
        let current = this.head;
        let counter = 0;
        while(current && counter < index -1) {
          current = current.next;
          counter++;
        }
        if (!current) {
            console.log("Index is unreachable. Please provide a valid index.");
            return;
        }
        newNode.next = current.next;
        current.next = newNode;
    }

    // Add a new node at the end of the linked list
    insertAtEnd(data) {
        let newNode = new Node(data);
        if(!this.head) {
            this.head = newNode;
        }
        else {
            let current = this.head;
            while(current.next) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    // Add a new node after a specific node in the linked list
    insertAfterNode(prevNode, data) {
        if(!prevNode) {
            console.log("Previous node should be valid");
            return;
        }
        let newNode = new Node(data);
        newNode.next = prevNode.next;
        prevNode.next = newNode;
    }

    // Function to traverse the linked list and print the elements
    display() {
        let current = this.head;
        while(current) {
            console.log(`Element: ${current.data}`);
            current = current.next;
        }
    }
}

// Creating an instance of LinkedList
const list = new LinkedList();

// Adding elements to the linked list
list.add(7);
list.add(11);
list.add(41);
list.add(66);

// Displaying the elements of the linked list
console.log('Initial linked list:');
list.display();

// Adding an element at the head of the linked list
list.insertAtHead(3);

// Displaying the elements of the linked list
console.log('Linked list after inserting at the head:');
list.display();

// Adding an element at a specific index in the linked list
list.insertAtIndex(56, 2);

// Displaying the elements of the linked list
console.log('Linked list after inserting at index 2:');
list.display();

// Adding an element at the end of the linked list
list.insertAtEnd(99);

// Displaying the elements of the linked list
console.log('Linked list after adding at the end:');
list.display();

// Adding an element after a specific node in the linked list
// Passing second node as the previous node 
// and 88 as the data to be added after the second node
// list.head.next refers to the second node in the linked list
list.insertAfterNode(list.head.next, 88);

// Displaying the elements of the linked list
console.log('Linked list after adding a node after a specific node:');
list.display();