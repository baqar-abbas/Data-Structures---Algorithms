// Data Structure Linked List Program for insertion and traversal in the Linked List
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

struct Node{
int data;
struct Node * next;
};

// Function to traverse the linked list and free memory
void freeLinkedList(struct Node* head) {
    struct Node* current = head;
    struct Node* nextNode;

    while (current != NULL) {
        nextNode = current->next; // Store the next node before freeing the current one
        free(current); // Free the memory for the current node
        current = nextNode; // Move to the next node
    }
}

void linkedListTraversal(struct Node *ptr)
{
    while(ptr!=NULL)
    {
     printf("Element: %d\n",ptr->data);
     ptr = ptr->next;
    }
}

// Function to insert a Node at the start(head) of the Linked List
struct Node * insertAtBegining(struct Node *head, int data)
{
    struct Node * ptr = (struct Node *) malloc(sizeof(struct Node));
    ptr->next = head;
    ptr->data = data;
    return ptr;
};

// Function to insert a Node at the specific index of the Linked List
struct Node * insertAtIndex(struct Node *head, int data, int index)
{
    struct Node * ptr = (struct Node *) malloc(sizeof(struct Node));
    struct Node * p = head;
    int i = 0;

    while(i!=index-1)
    {
     p = p->next;
     i++;
    }

    ptr->next = p->next;
    ptr->data = data;
    p->next = ptr;

    return head;
};

int main()
{
    // Declaring the nodes of the Linked list
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

    printf("Linked List\n");
    // Traverse through the linked list and print the elements
    linkedListTraversal(head);

    // Insert at the beginning (un comment the function call below to insert node at the start of Linked list)
    // head = insertAtBegining(head, 56);

    // Insert at specific index - This function won't work for insert at head
    // uncomment the function below to insert at a specific index in the Linked list
    head = insertAtIndex(head, 56, 2);

    printf("Linked List after Insertion.\n");

    // Traverse through the linked list and print the elements
    linkedListTraversal(head);

    // Free the dynamically allocated memory for the linked list
    freeLinkedList(head);

    return 0;
}
