// Program to implement Data Structure Linked List deletion operations in C language
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

// Structure of a Node
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

// Case1: Function to delete the Head Node of the linked list
struct Node * deleteAtFirst(struct Node * head)
{
    if (head == NULL) {
        printf("List is empty. No nodes to delete.\n");
        return NULL;
    }

    struct Node * ptr = head;
    head = head->next;
    free(ptr);
    printf("First node deleted successfully.\n");
    return head;
};

// Case 2: Function to delete a node at specific index of the linked list
struct Node * deleteAtIndex(struct Node * head, int index)
{
    struct Node *p = head;
    struct Node *q = head->next;
    for(int i = 0; i < index -1; i++)
    {
        p = p->next;
        q = q->next;
    }

    p->next = q->next;
    free(q);
    return head;
};

// Case 3: Function to delete a node at the end of the linked list
struct Node * deleteAtEnd(struct Node * head)
{
struct Node *p = head;
    struct Node *q = head->next;
    while(q->next!=NULL)
    {
        p = p->next;
        q = q->next;
    }
    p->next = NULL;
    free(q);
    return head;
};

// Case 4: function to delete a node with a specific value
struct Node * deleteAtValue(struct Node * head, int value)
{
  struct Node * p = head;
  struct Node * q = head->next;
  while(q->data!=value && q->next != NULL)
  {
      p = p->next;
      q = q->next;
  }
  if(q->data == value )
  {
      p->next = q->next;
      free(q);
  }
  else
  {
      printf("Node with Element not found !!!");
  }
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

    printf("Linked List before deletion\n");
    // Traverse through the linked list and print the elements
    linkedListTraversal(head);

    // Function call to delete the first(head) node of the linked List
    // Uncomment the function below to delete the Head node
    // head = deleteAtFirst(head);

        // Function to delete a node at index 2
    // Uncomment the function call below to delete a node at index 2
    // head = deleteAtIndex(head, 2);

        // Function to delete a node at the end of the linked list
    // Uncomment the function below to delete a node at the end
    // head = deleteAtEnd(head);

    head = deleteAtValue(head, 41);

    printf("Linked List after deletion\n");
    // Traverse through the linked list and print the elements
    linkedListTraversal(head);

    // Free the dynamically allocated memory for the linked list
    freeLinkedList(head);

    return 0;
}
