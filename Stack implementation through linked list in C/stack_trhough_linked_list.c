// Implementation of stack through arrays in C Language

#include<stdio.h>
#include<stdlib.h>

// Functions prototype declaration for stack operations
void push();
void pop();
void display();
void cleanup();

// Structure of a node in the linked list stack
struct node {
    int val;
    struct node *next;
};

// Head of the linked list stack
struct node *head = NULL;

void main()
{
    int choice = 0;
    printf("\n*********Stack operations using linked list*********\n");
    printf("\n----------------------------------------------\n");
    while(choice != 4)
    {
        printf("\n\nChoose one from the below options...\n");
        printf("\n1.Push\n2.Pop\n3.Show\n4.Exit");
        printf("\nEnter your choice \n");
        scanf("%d", &choice);
        // Switch case for the stack operations
        switch(choice)
        {
            case 1:
                push();
                break;
            case 2:
                pop();
                break;
            case 3:
                display();
                break;
            case 4:
                printf("Exiting....\n");
                cleanup();
                break;
            default:
                printf("Please Enter valid choice\n");
        }
    }
}

// Function definitions for stack operations for push, pop, show and peek
// Push operation to insert an element in the stack
void push()
{
    int val;
    // Creating a new node for the stack element
    // Dynamically allocating memory for the new node
    struct node *ptr = (struct node*)malloc(sizeof(struct node));
    // If memory is not allocated
        if(ptr == NULL) {
        printf("Not able to push the element\n");
    }
    // If memory is allocated
        else {
        printf("Enter the value\n");
        scanf("%d", &val);
        // If the stack is empty then the new node is the head of the stack
        if(head == NULL) {
            ptr->val = val;
            ptr->next = NULL;
            head = ptr;
        }
        // If the stack is not empty then the new node is the head of the stack
        else
        {
            ptr->val = val;
            ptr->next = head;
            head = ptr;
        }
        printf("Item pushed\n");
    }
}

// Pop operation to delete an element from the stack
void pop() {
    struct node *ptr;
    // If the stack is empty
    if(head == NULL) {
        printf("Underflow\n");
    } 
    // If the stack is not empty then the top element is deleted (POP operation)
    else {
        ptr = head;
        head = head->next;
        // Free the memory of the deleted node
        free(ptr);
        printf("Item popped\n");
    }
}

// Display operation to show the elements of the stack
void display() {
    struct node *ptr = head;
    if(ptr == NULL) {
        printf("Stack is empty\n");
    } else {
        printf("Printing Stack elements \n");
        while(ptr != NULL) {
            printf("%d\n", ptr->val);
            ptr = ptr->next;
        }
    }
}

// Cleanup operation to free the memory of the stack
void cleanup() {
    struct node *ptr;
    // Free the memory of all the nodes in the stack
    while(head != NULL) {
        ptr = head;
        head = head->next;
        free(ptr);
    }
    printf("Memory cleaned up\n");
}


