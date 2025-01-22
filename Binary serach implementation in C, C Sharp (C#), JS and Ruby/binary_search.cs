// Program to implement Binary Search in C# (C sharp)
// Please note: We can use visual studio 2022 to run this program by creating a new console app project and copying the code below.

using System;

namespace BinarySearchProgram
{
	class Program
	{
		// Function to implement Binary Search
		static int BinarySearch(int[] arr, int element)
		{
			// Initialize low and high 
			int low = 0;
			int high = arr.Length - 1;

			// Loop until low is less than or equal to high
			while (low <= high)
			{
				// Calculate the mid index
				int mid = (low + high) / 2;

				// Check if the element is at mid then returning mid index
				if (arr[mid] == element)
				{
					return mid;
				}
				// If element at mid is less than the target element, search the right half
				if (arr[mid] < element)
				{
					low = mid + 1;
				}
				// Else search the left half
				else
				{
					high = mid - 1;
				}
			}
			// If the element is not found, return -1
			return -1;
		}
		static void Main(string[] args) {
			
			// Sorted array for Binary Search
			int[] arr = { 1, 3, 5, 56, 64, 73, 123, 225, 444 };
			int element = 73;
			// Call the Binary Search function
			int searchedIndex = BinarySearch(arr, element);

			// Print the result
			if (searchedIndex != -1) {
				Console.WriteLine($"The element {element} found at index {searchedIndex}");
			}
			else
			{
				Console.WriteLine("Element not found in the array");
			}
            
		}
	}
}