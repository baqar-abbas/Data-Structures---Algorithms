// Implementation of deletion at specific index in an array
// Please note: We can use visual studio 2022 to run this program by creating a new console app project and copying the code below.

using System;

namespace ArrayDeletion
{
class Program
	{
		// Method to display the elements of the array
		static void Display(int[] arr, int size)
		{
            Console.WriteLine("Array Elements:");
			for (int i = 0; i < size; i++) {
                Console.WriteLine($"Element at index {i}: {arr[i]}");
			}
		}

		// Method to delete an element at a specific index
		static void DeleteAtIndex(int[] arr, ref int size, int index) {
			// Check if index is valid
			if (index < 0 || index >= size)
			{
                Console.WriteLine("Invalid index. Deletion failed.");
				return;
			}

			// Perform the deletion by shifting elements
			for (int i = index; i < size; i++)
			{
				arr[i] = arr[i + 1];
 			}

			// Decrease the size of the array
			size--;

			Console.WriteLine($"Element at index {index} has been deleted successfully.");
		}

		static void Main(string[] args) {
            // Initial array and size
			int[] arr = new int[10];
			arr[0] = 7;
			arr[1] = 8;
			arr[2] = 12;
			arr[3] = 27;
			arr[4] = 88;

			int size = 5;

            Console.WriteLine("Original Array:");
			Display(arr, size);
            // Index to delete
			int index = 2;

            // Perform deletion
			DeleteAtIndex(arr, ref size, index);

			Console.WriteLine("\nArray after deletion:");
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
Element at index 2 has been deleted successfully.

Array after deletion:
Array Elements:
Element at index 0: 7
Element at index 1: 8
Element at index 2: 27
Element at index 3: 88
*/