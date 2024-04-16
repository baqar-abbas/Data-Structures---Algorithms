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
list.display();