// Implementation of Queue Data Structure in C Language
#include <stdio.h>
#include <stdlib.h>

// Node structure
typedef struct Node {
    int data;
    struct Node* next;
} Node;

// Queue structure
typedef struct Queue {
    Node* front;
    Node* rear;
} Queue;

// Function to create a new node
Node* createNode(int value) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (!newNode) {
        printf("Memory allocation failed!\n");
        exit(1); // exit program if malloc fails
    }
    newNode->data = value;
    newNode->next = NULL;
    return newNode;
}

// Function to create an empty queue
Queue* createQueue() {
    Queue* q = (Queue*)malloc(sizeof(Queue));
    if (!q) {
        printf("Memory allocation failed!\n");
        exit(1);
    }
    q->front = q->rear = NULL;
    return q;
}

// Enqueue operation
void enqueue(Queue* q, int value) {
    Node* newNode = createNode(value);
    if (q->rear == NULL) { // queue is empty
        q->front = q->rear = newNode;
        return;
    }
    q->rear->next = newNode;
    q->rear = newNode;
}

// Dequeue operation
int dequeue(Queue* q) {
    if (q->front == NULL) {
        printf("Queue is empty!\n");
        return -1;
    }

    Node* temp = q->front;
    int data = temp->data;
    q->front = q->front->next;

    // If queue becomes empty
    if (q->front == NULL) {
        q->rear = NULL;
    }

    free(temp); // free memory to avoid leaks

    return data;
}

// Peek operation
int peek(Queue* q) {
    if (q->front == NULL) {
        printf("Queue is empty!\n");
        return -1;
    }
    return q->front->data;
}

// Check if queue is empty
int isEmpty(Queue* q) {
    return q->front == NULL;
}

// Free entire queue memory
void freeQueue(Queue* q) {
    Node* current = q->front;
    Node* nextNode;

    while (current != NULL) {
        nextNode = current->next;
        free(current);
        current = nextNode;
    }

    free(q); // free queue structure itself
}

int main() {
    Queue* q = createQueue();

    enqueue(q, 10);
    enqueue(q, 20);
    enqueue(q, 30);

    printf("Front element: %d\n", peek(q));
    printf("Dequeued: %d\n", dequeue(q));
    printf("Dequeued: %d\n", dequeue(q));

    enqueue(q, 40);
    printf("Front element: %d\n", peek(q));

    // Free memory before program ends
    freeQueue(q);

    return 0;
}
