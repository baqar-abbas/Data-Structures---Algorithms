// Challenge description - Solve Coding Challenge in JS

/*

Linked List

Implement the following two methods in your own LinkedList class. 
You should start with your code from challenge.js

addAt(index, item) - Add an item to a specific location in the list. The index will be a positive integer that represents the index where you should insert item. Zero is the position of the first element of the list. remove(index) - Remove an item from a specific location in the List.

You should also implement a private helper method get_node(index) to return the Node at a specific index.

You should have already completed these two methods in the previous challenge:
add(number) - Add number to the end of your LinkedList. get(index) - Get the number located at index.

Example

This is an example of a test case:

const list = new LinkedList()

list.add(3)
list.add(5)
list.addAt(2, 11)
list.addAt(3, 13)
console.log(list.get(2))
// => 11

console.log(list.get(3))
// => 5

The add operations create the list: [13, 3, 11, 5]. The get operation, gets the numbers located at position 2 and 3.
*/

// Solution

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

    // Function to traverse the linked list and print the elements at a given index
    get(index) {
        let current = this.head;
        let count = 0;
        while(current) {
            if(count === index) {
                return current.data;
            }
            count++;
            current = current.next;
        }
    }

    // Add an item to a specific location in the list
    addAt(index, item) {
       if(index === 0) {
        const newNode = new Node(item);
        newNode.next = this.head;
        this.head = newNode;
        return;
       }
       
       // Get the node at the index - 1
       const previous = this.get_node(index - 1);
       if(!previous) {
           return;
       }

       const newNode = new Node(item);
       newNode.next = previous.next;
       previous.next = newNode;
       }

    // Remove an item from a specific location in the List
    remove(index) {
    if(index === 0) {
        this.head = this.head.next;
        return;
    }

    const previous = this.get_node(index - 1);
    if(!previous || !previous.next) {
        return;
    }
    previous.next = previous.next.next;
    }

    // Helper method to return the Node at a specific index
    get_node(index) {
        let current = this.head;
        let count = 0;
        while(current) {
            if(count === index) {
                return current;
            }
            count++;
            current = current.next;
        }
    }
}

const list = new LinkedList();

// Adding elements to the linked list
list.add(3);
list.add(5);
// Adding elements at specific positions
list.addAt(1, 11);
list.addAt(0, 13);  

// Displaying the elements of the linked list
console.log("The Element at index 1 is: ", list.get(1)); // 5

console.log("The Element at index 2 is: ", list.get(2)); // 11

console.log("The Element at index 3 is: ", list.get(3)); // 13