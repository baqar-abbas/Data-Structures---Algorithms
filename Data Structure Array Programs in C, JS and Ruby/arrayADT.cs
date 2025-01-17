// Implementation of Array ADT program in C# (C sharp)
// Please note: We can use visual studio 2022 to run this program by creating a new console app project and copying the code below.

using System;

namespace ArrayADT
{
	// Define the MyArray class for Array ADT implementation
	public class MyArray
	{
		// Properties for total size, used size, and array data
		public int TotalSize { get; private set; }
		public int UsedSize { get; private set; }

		private int[] Data;

		// Constructor to initialize the array
		public MyArray(int totalSize, int usedSize)
		{
			if (usedSize > totalSize)
			{
				throw new Exception("Used size cannot be greater than total size.");
			}
			TotalSize = totalSize;
			UsedSize = usedSize;
			Data = new int[TotalSize];
            Console.WriteLine("Array Created");
		}

		public void SetValue(int index, int value)
		{
			if (index < 0 || index >= UsedSize)
			{
				Console.WriteLine("Invalid Index");
				return;
			}
			Data[index] = value;
			Console.WriteLine($"Value {value} has been inserted at index {index}");
		}

		public void Show()
		{
			for (int i = 0; i < UsedSize; i++)
			{
				Console.WriteLine($"The value at index {i} is {Data[i]}");
			}
		}
	}

	// Entry point of the program
	class Program
	{
		public static void Main(string[] args)
		{
			Console.WriteLine("Creating an array...");
			// Create an instance of MyArray
			MyArray myArray = new MyArray(10, 3);

			Console.WriteLine("Setting values...");
			myArray.SetValue(0, 10);
			myArray.SetValue(1, 20);
			myArray.SetValue(2, 30);

			Console.WriteLine("Showing the array elements...");
			myArray.Show();

			Console.WriteLine("Program completed.");


		}
	}


}

// Output:
// Creating an array...
// Array Created
// Setting values...
// Value 10 has been inserted at index 0
// Value 20 has been inserted at index 1
// Value 30 has been inserted at index 2
// Showing the array elements...
// The value at index 0 is 10
// The value at index 1 is 20
// The value at index 2 is 30
// Program completed.
