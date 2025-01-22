//Program to implement Linked List in C Sharp (C#)
// Please note: We can use visual studio 2022 to run this program by creating a new console app project and copying the code below.

using System;

namespace LinkedListProgram
{
	// Node class to represent each node in the linked list
	public class Node
	{
		public int Data { get; set; } // Data of the node
		public Node Next { get; set; } // Reference to the next node

		// Constructor to initialize the node with data and optionally the next node
		public Node(int data, Node next = null)
		{
			Data = data;
			Next = next;
		}
	}

	// LinkedList class to represent the linked list
	public class LinkedList
	{
		private Node head; // Reference to the head of the linked list

		// Method to add a new node to the linked list
		public void Add(int data)
		{
			Node newNode = new Node(data);
			if (head == null)
			{
				head = newNode;
			}
			else
			{
				Node current = head;
				while (current.Next != null)
				{
					current = current.Next;
				}
				current.Next = newNode;
			}
		}

		// Method to display all elements in the linked list
		public void Display()
		{
			Node current = head;
			while (current != null)
			{
				Console.WriteLine($"Element: {current.Data}");
				current = current.Next;
			}
		}
	}

	class Program
	{
		static void Main(string[] args)
		{
			// Create an instance of the LinkedList
			LinkedList list = new LinkedList();

			// Add elements to the linked list
			list.Add(7);
			list.Add(11);
			list.Add(41);
			list.Add(66);

			// Display the elements of the linked list
			Console.WriteLine("Elements in the linked list:");
			list.Display();
		}
	}
}

// Output:
/* 
Elements in the linked list:
Element: 7
Element: 11
Element: 41
Element: 66
*/