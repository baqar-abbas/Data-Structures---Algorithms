// Implementation of insertion at specific index in an array
// Please note: We can use visual studio 2022 to run this program by creating a new console app project and copying the code below.
using System;

namespace ArrayInsertion
{
	class Program
	{
		// Method to display array elements
		static void Display(int[] arr, int size)
		{
			Console.WriteLine("Array Elements:");
			for (int i = 0; i < size; i++)
			{
				Console.WriteLine($"Element at index {i}: {arr[i]}");
			}
		}

		// Method to insert an element at a specific index
		static int InsertAtIndex(int[] arr, int size, int element, int capacity, int index)
		{
			// Check if the array is full
			if (size >= capacity)
			{
				Console.WriteLine("Array is full. Cannot insert new element.");
				return -1;
			}

			// Shift elements to the right to make space
			for (int i = size - 1; i >= index; i--)
			{
				arr[i + 1] = arr[i];
			}

			arr[index] = element;
			Console.WriteLine($"Element {element} inserted at index {index} successfully.");
			return 1;
		}

		static void Main(string[] args)
		{
			// Array declaration and initialization
			int[] arr = new int[10]; // Declare array with capacity of 10
			arr[0] = 7;
			arr[1] = 8;
			arr[2] = 12;
			arr[3] = 27;
			arr[4] = 88;

			int size = 5; // Current size of the array
			int capacity = 10; // Maximum capacity of the array
			int element = 45; // Element to be inserted
			int index = 3; // Index at which to insert the element

			// Display the original array
			Console.WriteLine("Original Array:");
			Display(arr, size);

			// Insert the element at the specified index
			Console.WriteLine($"\nInserting element {element} at index {index}...");
			InsertAtIndex(arr, size, element, capacity, index);

			// Increment size after insertion
			size++;

			// Display the array after insertion
			Console.WriteLine("\nArray after insertion:");
			Display(arr, size);
		}
	}
}

// Output:
/*
Original Array:
Array Elements:
Element at index 0: 7
Element at index 1: 8
Element at index 2: 12
Element at index 3: 27
Element at index 4: 88

Inserting element 45 at index 3...
Element 45 inserted at index 3 successfully.

Array after insertion:
Array Elements:
Element at index 0: 7
Element at index 1: 8
Element at index 2: 12
Element at index 3: 45
Element at index 4: 27
Element at index 5: 88 
*/