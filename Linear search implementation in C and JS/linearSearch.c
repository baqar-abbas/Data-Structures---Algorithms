// Program to implement Linear Search in C Language
#include <stdio.h>
#include <conio.h>

// Function to implement Linear Search
int linearSearch(int arr[], int size, int element)
{
    for (int i=0; i<size; i++)
    {
        if(arr[i]==element)
        {
            return i;
        }
    }
    // If the element is not found return -1
    return -1;
}

int main()
{
int arr[] = {1,3,5,56,4,3,23,5,4,5632,56,34};
// Size of the array
int size = sizeof(arr)/sizeof(int);
int element = 56;
// Calling the function to do Linear Search
int searchIndex = linearSearch(arr, size, element);
// Printing the element and the index where it was found
printf("The element %d was found at index %d", element, searchIndex);
return 0;
}
