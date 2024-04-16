// Program to implement Data Structures Linked List deletion operations in JavaScript

// Define a Node class to represent the node of the linked list
class Node {
    constructor(data, next = null) {
        this.data = data;
        this.next = next;
    }
}

// Define a LinkedList class to represent the linked list
class LinkedList {
    contructor() {
        this.head = null;
    }

    // Add a new node to the linked list
    add(data) {
        const newNode = new Node(data);
        if(!this.head) {
            this.head = newNode;
        } else {
            let current = this.head;
            while(current.next) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    // Function to delete the node at the head of the linked list
    deleteAtHead() {
        if (!this.head) {
            console.log("Linked list is empty. No node to delete.");
            return;
        }
        this.head = this.head.next;
    }

    // Function to delete the node at a specific index in the linked list
    deleteAtIndex(index) {
        if (index === 0) {
            this.head = this.head.next;
            return;
        }
        let current = this.head;
        let prev = null;
        let counter = 0;
        
        while (current && counter < index) {
            prev = current;
            current = current.next;
            counter++;
        }
        if (!current) {
            console.log(`Index ${index} not found in the linked list.`);
            return;
        }
        prev.next = current.next;
    }

    // Function to delete the node at the end of the linked list
    deleteAtEnd() {
        if (!this.head) {
            console.log("Linked list is empty. No node to delete.");
            return;
        }
        let current = this.head;
        let prev = null;
        while (current.next) {
            prev = current;
            current = current.next;
        }
        prev.next = null;
    }

    // Function to delete the node with a specific value in the linked list
    deleteByValue(value) {
        if(!this.head) {
            console.log("Linked list is empty. No node to delete.");
            return;
        }
        if(this.head.data === value) {
            this.head = this.head.next;
            return;
        }
        let current = this.head;
        let prev = null;
        while(current && current.data !== value) {
            prev = current;
            current = current.next;
        }
        if (!current) {
            console.log(`Node with value ${value} not found in the linked list.`);
            return;
        }
        prev.next = current.next;
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

// Displaying the elements of the linked list before deletion
console.log('Linked list before deletion:');
list.display();

// Deleting the node at the head of the linked list - Uncomment the line below to test
// list.deleteAtHead();

// Deleting the node at a specific index in the linked list - Uncomment the line below to test
// list.deleteAtIndex(2);

// Deleting the node at the end of the linked list - Uncomment the line below to test
// list.deleteAtEnd();

// Deleting the node with a specific value in the linked list 
  list.deleteByValue(41);

// Displaying the elements of the linked list after deletion
console.log('Linked list after deletion:');
list.display();
