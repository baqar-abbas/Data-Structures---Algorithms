// Program to Implement Recursion in C Sharp (C#)

using System;

class Program
{
	// Recursive method for factorial
	static int Factorial(int n)
	{
	 if (n == 0) // Base case
		{
			return 1;
		}
	 else
		{
			return n * Factorial(n - 1); // Recursive call
		}
	}

	static void Main()
	{
		Console.WriteLine("Enter a number: ");
		string input = Console.ReadLine();

        // Validate if input is a non-negative integer
        if (int.TryParse(input, out int num) && num >= 0)
        {
            int result = Factorial(num);
            Console.WriteLine($"Factorial of {num} is {result}");
        }
        else
        {
            Console.WriteLine("Invalid input! Please enter a valid non-negative integer.");
        }


	}
}