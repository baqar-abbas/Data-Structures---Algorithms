// Challenge description - Solve Coding Challenge in JS

/* 
Linked Lists

Create your own LinkedList class for storing integers which should include two methods:
add(number) - Add a new Node to the end of the list with a value of number. Nothing needs to be returned. get(index) - Return the value of the Node at position index in the List.

Example


This is an example of a test case:  

const list = new LinkedList()

list.add(3)
list.add(5)
console.log(list.get(1))
// => 5

The 2 add operations create the list: [3, 5]. The get operation, gets the number located at position 1.
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
}

const list = new LinkedList();

// Adding elements to the linked list
list.add(3);
list.add(5);
list.add(7);
list.add(11);

// Displaying the elements of the linked list
console.log("The Element at index 1 is: ", list.get(1)); // 5