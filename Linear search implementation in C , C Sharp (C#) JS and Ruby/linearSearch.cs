// Program to implement Linear Search in C# (C sharp)
// Please note: We can use visual studio 2022 to run this program by creating a new console app project and copying the code below.

using System;

class LinearSearchProgram
{
	// Function to implement Linear Search
	public static int LinearSearch(int[] arr, int element)
	{
		// Iterate through the array
		for (int i = 0; i < arr.Length; i++)
		{
			// Check if the current element matches the search element
			if (arr[i] == element)
			{
				return i; // Return the index if the element is found
			}
		}

		// If the element is not found, return -1
		return -1;
	}

	static void Main(string[] args)
	{
		// Array to search in
		int[] arr = { 1, 3, 5, 56, 4, 3, 23, 5, 4, 5632, 56, 34 };

		// Element to search for
		int element = 23;

		// Call the LinearSearch function
		int searchIndex = LinearSearch(arr, element);

		// Output the result
		if (searchIndex != -1)
		{
			Console.WriteLine($"The element {element} was found at index {searchIndex}");
		}
		else
		{
			Console.WriteLine($"The element {element} was not found in the array");
		}
	}
}