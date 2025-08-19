// Implementation of Queue data stucture in C sharp (C#)

using System;

namespace QueueImplementation
{
    // Node class
    class Node
    {
        public int Data;
        public Node? Next;

        public Node(int data)
        {
            Data = data;
            Next = null;
        }
    }

    // Queue class
    class Queue
    {
        private Node? front;
        private Node? rear;

        public Queue()
        {
            front = null;
            rear = null;
        }

        // Enqueue operation
        public void Enqueue(int value)
        {
            Node newNode = new Node(value);
            if (rear == null)
            {
                front = rear = newNode;
            }
            else
            {
                rear.Next = newNode;
                rear = newNode;
            }
        }

        // Dequeue operation
        public int? Dequeue()
        {
            if (front == null)
            {
                Console.WriteLine("Queue is empty!");
                return null;
            }

            int value = front.Data;
            front = front.Next;

            if (front == null)
            {
                rear = null;
            }

            return value;
        }

        // Peek operation
        public int? Peek()
        {
            if (front == null)
            {
                Console.WriteLine("Queue is empty!");
                return null;
            }
            return front.Data;
        }

        // Check if empty
        public bool IsEmpty()
        {
            return front == null;
        }


        // Print queue elements
        public void PrintQueue()
        {
            if (front == null)
            {
                Console.WriteLine("Queue is empty!");
                return;
            }

            Node current = front;
            Console.Write("Front -> ");
            while (current != null)
            {
                Console.Write("[" + current.Data + "] -> ");
                current = current.Next;
            }
            Console.WriteLine("NULL");
        }


    }

    // Queue usage
    class Program
    {
        static void Main(string[] args)
        {
            Queue q = new Queue();

            q.Enqueue(10);
            q.Enqueue(20);
            q.Enqueue(30);
            q.PrintQueue();   // Front -> [10] -> [20] -> [30] -> NULL

            Console.WriteLine("Front element: " + q.Peek()); // 10
            Console.WriteLine("Dequeued: " + q.Dequeue());   // 10
            q.PrintQueue();   // Front -> [20] -> [30] -> NULL

            q.Enqueue(40);
            q.PrintQueue();   // Front -> [20] -> [30] -> [40] -> NULL
        }
    }
}

// Output:
// Front -> [10] -> [20] -> [30] -> NULL
// Front element: 10
// Dequeued: 10
// Front -> [20] -> [30] -> NULL
// Front -> [20] -> [30] -> [40] -> NULL