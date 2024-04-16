#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

// Declare the structure of a node
struct Node{
int data;
struct Node * next;
};

// Function to traverse the linked list and free memory
void freeLinkedList(struct Node* head) {
    struct Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

// Function to traverse the linked list and print the elements
void linkedListTraversal(struct Node *ptr)
{
    while(ptr!=NULL)
    {
     printf("Element: %d\n",ptr->data);
     ptr = ptr->next;
    }
}

int main()
{
    // Declare the nodes of the linked list
    struct Node * head;
    struct Node * second;
    struct Node * third;
    struct Node * fourth;

    // Allocate Memory in the heap for nodes in the linked list
    head = (struct Node *) malloc(sizeof(struct Node));
    second = (struct Node *) malloc(sizeof(struct Node));
    third = (struct Node *) malloc(sizeof(struct Node));
    fourth = (struct Node *) malloc(sizeof(struct Node));

    // Link first and second node
    head->data = 7;
    head->next = second;

    // Link second and third node
    second->data = 11;
    second->next = third;

    // Link third and fourth node
    third->data = 41;
    third->next = fourth;

     // Terminate the list at the third node
    fourth->data = 66;
    fourth->next = NULL;

    // Traverse through the linked list and print the elements
    linkedListTraversal(head);

    // Free the dynamically allocated memory for the linked list
    freeLinkedList(head);

    return 0;
}
